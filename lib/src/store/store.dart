import 'dart:async';
import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:rxdart/rxdart.dart';

import '../view_model/view_models.dart';

abstract class Store {
  String get username;

  final ViewModel vm = GetIt.I.get<ViewModel>();

  Future<BuiltList<Survey>> fetchSurveys();

  Future<BuiltList<Submission>> fetchSubmissions({required int surveyId});

  Future<BuiltList<ChoiceQuestionAnswer>> fetchGeneralSubmissionData(
      {required int surveyTypeId,
      required List<int> submissionIds,
      required List<String> questions});

  Future<Iterable<SubmissionLink>> fetchSubmissionLinksForChildSubmission(
      {required Submission submission});

  Future<BuiltList<SubmissionLink>> fetchSubmissionLinksForSubmission(
      {required Submission submission});

  @override
  Future<Iterable<SubmissionLink>> fetchSubmissionLinksForSubmissions({
    required Iterable<Submission> submissions,
  });

  Future<BuiltList<SubmissionLink>> fetchSubmissionLinks();

  //final ChoiceQuestionAnswerViewModel choiceQuestionAnswerCache =
  //    ChoiceQuestionAnswerViewModel();
  //final choiceQuestionAnswersBySubmissionAndPath =
  //    <Submission, Map<SurveyEntryPath, Map<int, ChoiceQuestionAnswer>>>{};
  //final choiceQuestionAnswersChacheChanged = BehaviorSubject.seeded(true);

  BehaviorSubject<BuiltMap<Submission, ChoiceAnswerValidationResult>>
      errorBySubmissionAndPathBehaviour = BehaviorSubject.seeded(
          BuiltMap<Submission, ChoiceAnswerValidationResult>({}));

  set errorBySubmissionAndPath(
          BuiltMap<Submission, ChoiceAnswerValidationResult> errors) =>
      errorBySubmissionAndPathBehaviour.value = errors;

  BuiltMap<Submission, ChoiceAnswerValidationResult>
      get errorBySubmissionAndPath => errorBySubmissionAndPathBehaviour.value;

  void clearValidationResult() {
    errorBySubmissionAndPath =
        BuiltMap<Submission, ChoiceAnswerValidationResult>({});
  }

  BehaviorSubject<BuiltMap<int, ChoiceQuestionAnswer>>
      choiceQuestionAnswersById =
      BehaviorSubject.seeded(BuiltMap(<int, ChoiceQuestionAnswer>{}));

  BehaviorSubject<BuiltMap<SurveyEntryPath, bool>> enabledByPath =
      BehaviorSubject.seeded(BuiltMap<SurveyEntryPath, bool>({}));

  Future<Iterable<ChoiceQuestionAnswer>> fetchChoiceAnswers(
      {required Iterable<Submission> submissions});

  removeChoiceQuestionAnswers(
      {required Set<ChoiceQuestionAnswer> choiceQuestionAnswers});

  addChoiceAnswer(
      {required Submission submission,
      required int linkedSubmissionId,
      required SurveyEntryPath path,
      required String newQuestion,
      required String answer});

  @override
  Future<BuiltList<ChoiceQuestionAnswer>> insertChoiceAnswers(
      {required BuiltList<ChoiceQuestionAnswer> answers});

  updateChoiceAnswers({required BuiltSet<ChoiceQuestionAnswer> updates});

  inheritChoiceAnswers(
      {required BuiltList<ChoiceQuestionAnswer> choiceAnswersToInherit,
      required int idOfSubmissionWhichInherits}) async {
    final originalAnswers = choiceAnswersToInherit;

    final answersWithUpdatedSubmissionId = {
      for (final a in originalAnswers)
        a.rebuild((b) => b.submissionId = idOfSubmissionWhichInherits)
    }.toBuiltList();

    final insertedAnswersWithOldParentId =
        await insertChoiceAnswers(answers: answersWithUpdatedSubmissionId);

    vm.choiceQuestionAnswerViewModel.update(insertedAnswersWithOldParentId);

    final updatesToTheParentId = <ChoiceQuestionAnswer>{};
    for (var answerWithNewIdAndSubmissionIdButOldParentId
        in insertedAnswersWithOldParentId) {
      if (answerWithNewIdAndSubmissionIdButOldParentId.parentId == null) {
        continue;
      }
      final answerWithUpdatedParentId =
          answerWithNewIdAndSubmissionIdButOldParentId.updateParentId(
              answersBeforeInsert: answersWithUpdatedSubmissionId,
              returnedAnswersFromInsert: insertedAnswersWithOldParentId);

      updatesToTheParentId.add(answerWithUpdatedParentId);
    }

    updateChoiceAnswers(updates: updatesToTheParentId.toBuiltSet());
  }

  FutureOr<Submission> addSubmission(
      {required Survey survey,
      required String submissionTitle,
      required String createdBy});

  Future deleteSubmission({required Submission submission});

  Future<Iterable<SubmissionLink>> insertSubmissionLinks({
    required Iterable<SubmissionLink> submissionLinks,
  });

  @override
  Future<Submission> duplicateSubmission(
      {required Submission submissionToDuplicate,
      required String submissionTitle,
      required String createdBy}) async {
    final newSubmission = await addSubmission(
        survey: submissionToDuplicate.getSurvey(vm),
        submissionTitle: submissionTitle,
        createdBy: createdBy);

    final originalAnswers =
        await fetchChoiceAnswers(submissions: {submissionToDuplicate});

    final answersWithUpdatedSubmissionIdAndLinkedSubmissionId = [
      for (final a in originalAnswers)
        a.rebuild((b) {
          if (a.submissionId == a.linkedSubmissionId) {
            b.linkedSubmissionId = newSubmission.id;
          }

          b.submissionId = newSubmission.id;
        })
    ].toBuiltList();

    final insertedAnswersWithOldParentId = await insertChoiceAnswers(
        answers: answersWithUpdatedSubmissionIdAndLinkedSubmissionId);

    vm.choiceQuestionAnswerViewModel.update(insertedAnswersWithOldParentId);

    final updatesToTheParentId = <ChoiceQuestionAnswer>{
      for (final insertedAnswerWithOldParentId
          in insertedAnswersWithOldParentId)
        if (insertedAnswerWithOldParentId.parentId != null)
          insertedAnswerWithOldParentId.updateParentId(
              answersBeforeInsert:
                  answersWithUpdatedSubmissionIdAndLinkedSubmissionId,
              returnedAnswersFromInsert: insertedAnswersWithOldParentId)
    }.toBuiltSet();

    updateChoiceAnswers(updates: updatesToTheParentId);

    final linksToDuplicate = await fetchSubmissionLinksForChildSubmission(
        submission: submissionToDuplicate);

    final newLinks = {
      for (final link in linksToDuplicate)
        link.getNewLink(
            answersBeforeInsert:
                answersWithUpdatedSubmissionIdAndLinkedSubmissionId,
            answersAfterInsert: insertedAnswersWithOldParentId,
            newSubmission: newSubmission)
    }.toBuiltSet();
    insertSubmissionLinks(submissionLinks: newLinks);

    final concretisationsToDuplicate = await fetchConcretisations(
        choiceQuestionAnswerIds: originalAnswers.map((a) => a.id).toList());

    final newConcretisations = {
      for (final concretisationToDuplicate in concretisationsToDuplicate)
        concretisationToDuplicate.getNewConcretisation(
            answersBeforeInsert:
                answersWithUpdatedSubmissionIdAndLinkedSubmissionId,
            answersAfterInsert: insertedAnswersWithOldParentId,
            newSubmission: newSubmission)
    }.toBuiltSet();
    insertConcretisations(concretisations: newConcretisations);

    return newSubmission;
  }

  Future<Submission> updateSubmission(
      {required Submission original, required Submission updates});

  Future deleteInheritedPropertiesFromSubmission(
      {required SubmissionLink submissionLink});

  Future<Iterable<Concretisation>> fetchConcretisations(
      {required Iterable<int> choiceQuestionAnswerIds});

  addConcretisation(
      {required ChoiceQuestionAnswer choiceQuestionAnswer,
      required ConcretisationValueBase concretisation});
  Future<BuiltList<Concretisation>> insertConcretisations(
      {required BuiltSet<Concretisation> concretisations});
  updateConcretisation(Concretisation concretisation);
  deleteConcretisation({required BuiltSet<Concretisation> concretisations});

  addSubmissionLink(
      {required ViewModel vm,
      required Submission submission,
      required SurveyEntryPath path,
      required LinkOtherSurveyQuestion question,
      required Submission linkedSubmission});

  deleteSubmissionLink({required SubmissionLink submissionLink});

  BehaviorSubject<BuiltSet<String>> choiceQuestionTypes =
      BehaviorSubject.seeded(BuiltSet<String>());

  BehaviorSubject<BuiltSet<String>> choiceAnswerTypes =
      BehaviorSubject.seeded(BuiltSet<String>());

  BehaviorSubject<BuiltMap<int, BuiltMap<String, dynamic>>>
      generalSubmissionDataById =
      BehaviorSubject.seeded(BuiltMap(<int, BuiltMap<String, dynamic>>{}));

  void addChoiceQuestionTypesToCache(BuiltSet<String> types) {
    choiceQuestionTypes.value =
        choiceQuestionTypes.value.rebuild((b) => b.addAll(types));
  }

  void addChoiceAnswerTypesToCache(BuiltSet<String> types) {
    choiceAnswerTypes.value =
        choiceAnswerTypes.value.rebuild((b) => b.addAll(types));
  }
}
