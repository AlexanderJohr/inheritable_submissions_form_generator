import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/store/store.dart';
import 'package:json_to_survey/src/store/survey_entry_path_extensions.dart';
import 'package:json_to_survey/src/value_types/submission_extensions.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:postgres/postgres.dart';
import 'package:rxdart/rxdart.dart';

import '../view_model/view_models.dart';

class LocalStore extends Store {
  LocalStore();

  @override
  String get username => "local";


  bool validateSurveyTypes(BuiltList<Survey> surveyTypes) {
    return surveyTypes.every((surveyType) => surveyType.validate());
  }

  @override
  Future<BuiltList<Survey>> fetchSurveys() async {
    return vm.surveyViewModel.byId.values.toBuiltList();
  }

  @override
  Future<BuiltList<Submission>> fetchSubmissions(
      {required int surveyId}) async {
    // TODO: handle surveyId
    return vm.submissionViewModel.byId.values.toBuiltList();
  }

  @override
  Future<BuiltList<ChoiceQuestionAnswer>> fetchGeneralSubmissionData(
      {required int surveyTypeId,
      required List<int> submissionIds,
      required List<String> questions}) async {
    return vm.choiceQuestionAnswerViewModel.byId.values.toBuiltList();
  }

  @override
  Future<Iterable<SubmissionLink>> fetchSubmissionLinksForChildSubmission(
      {required Submission submission}) async {
    return vm.submissionLinkViewModel.byChildId[submission.id] ??
        const Iterable.empty();
  }

  @override
  Future<BuiltList<SubmissionLink>> fetchSubmissionLinksForSubmission(
      {required Submission submission}) async {
    return vm.submissionLinkViewModel.byId.values.toBuiltList();
  }

  @override
  Future<Iterable<SubmissionLink>> fetchSubmissionLinksForSubmissions({
    required Iterable<Submission> submissions,
  }) async => vm.submissionLinkViewModel.byId.values.toBuiltList();


  @override
  Future<BuiltList<SubmissionLink>> fetchSubmissionLinks() async {
    return vm.submissionLinkViewModel.byId.values.toBuiltList();
  }

  @override
  Future<Iterable<ChoiceQuestionAnswer>> fetchChoiceAnswers(
          {required Iterable<Submission> submissions}) async =>
      vm.choiceQuestionAnswerViewModel.answersForSubmissions(submissions);

  @override
  Future<Iterable<Concretisation>> fetchConcretisations(
      {required Iterable<int> choiceQuestionAnswerIds}) async {
    return vm.concretisationsViewModel.byId.values.toBuiltList();
  }

  @override
  addChoiceAnswer(
      {required Submission submission,
      required int linkedSubmissionId,
      required SurveyEntryPath path,
      required String newQuestion,
      required String answer}) async {
    final parentId = path.getParentId(vm: vm, submission: submission);
    final newID = vm.choiceQuestionAnswerViewModel.byId.keys.max + 1;
    vm.choiceQuestionAnswerViewModel.update([
      ChoiceQuestionAnswer((b) => b
        ..id = newID
        ..submissionId = submission.id
        ..question = newQuestion
        ..linkedSubmissionId = linkedSubmissionId
        ..answer = answer
        ..parentId = parentId)
    ]);
  }

  @override
  Future<BuiltList<ChoiceQuestionAnswer>> insertChoiceAnswers(
      {required BuiltList<ChoiceQuestionAnswer> answers}) async {
    vm.choiceQuestionAnswerViewModel.update(answers);
    return answers;
  }

  @override
  Future<BuiltList<ChoiceQuestionAnswer>> updateChoiceAnswers(
      {required BuiltSet<ChoiceQuestionAnswer> updates}) async {
    vm.choiceQuestionAnswerViewModel.update(updates);
    return updates.toBuiltList();
  }

  @override
  removeChoiceQuestionAnswers(
      {required Iterable<ChoiceQuestionAnswer> choiceQuestionAnswers}) async {
    vm.choiceQuestionAnswerViewModel.remove(choiceQuestionAnswers);
  }

  @override
  addConcretisation(
      {required ChoiceQuestionAnswer choiceQuestionAnswer,
      required ConcretisationValueBase concretisation}) async {
    final newId = vm.concretisationsViewModel.byId.keys.max + 1;

    vm.concretisationsViewModel.update([
      Concretisation((b) => b
        ..id = newId
        ..orderIndex = newId
        ..choiceQuestionAnswerId = choiceQuestionAnswer.id
        ..concretisationValue = concretisation)
    ]);
  }

  @override
  Future<BuiltList<Concretisation>> insertConcretisations(
      {required BuiltSet<Concretisation> concretisations}) async {
    vm.concretisationsViewModel.update(concretisations);
    return concretisations.toBuiltList();
  }

  @override
  deleteConcretisation(
      {required BuiltSet<Concretisation> concretisations}) async {
    vm.concretisationsViewModel.remove(concretisations.toBuiltList());
  }

  @override
  updateConcretisation(Concretisation concretisation) async {
    vm.concretisationsViewModel.update([concretisation]);
  }

  @override
  FutureOr<Submission> addSubmission(
      {required Survey survey,
      required String submissionTitle,
      required String createdBy}) async {
    final newId = vm.submissionViewModel.byId.keys.max + 1;
    var submission = Submission((b) => b
      ..id = newId
      ..title = submissionTitle
      ..createdBy = createdBy);
    vm.submissionViewModel.update([submission]);
    return submission;
  }

  @override
  Future<Submission> updateSubmission(
      {required Submission original, required Submission updates}) async {
    vm.submissionViewModel.update({updates});
    return updates;
  }

  @override
  Future deleteInheritedPropertiesFromSubmission(
      {required SubmissionLink submissionLink}) async {
    vm.choiceQuestionAnswerViewModel.byId.removeWhere((_, answer) =>
        answer.submissionId == submissionLink.childId &&
        answer.linkedSubmissionId == submissionLink.parentId);
  }

  @override
  Future deleteSubmission({required Submission submission}) async {
    vm.submissionViewModel.remove({submission});
  }

  @override
  addSubmissionLink(
      {required ViewModel vm,
      required Submission submission,
      required SurveyEntryPath path,
      required LinkOtherSurveyQuestion question,
      required Submission linkedSubmission}) async {
    final choiceQuestionAnswerParent =
        path.getParentId(submission: submission, vm: vm);
    var submissionLink = SubmissionLink((b) => b
      ..parentId = linkedSubmission.id
      ..childId = submission.id
      ..choiceQuestionAnswerParent = choiceQuestionAnswerParent
      ..relationship = question.id);

    vm.submissionLinkViewModel.update({submissionLink});
  }

  @override
  Future<Iterable<SubmissionLink>> insertSubmissionLinks({
    required Iterable<SubmissionLink> submissionLinks,
  }) async {
    vm.submissionLinkViewModel.update(submissionLinks);
    return submissionLinks;
  }

  @override
  deleteSubmissionLink({required SubmissionLink submissionLink}) async {
    vm.submissionLinkViewModel.remove({submissionLink});

  }
}
