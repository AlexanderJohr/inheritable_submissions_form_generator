import 'dart:collection';
import 'dart:ffi';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/subjects.dart';

import '../value_types/survey.dart';

class ViewModel {
  final SurveyViewModel surveyViewModel = SurveyViewModel();

  final SubmissionViewModel submissionViewModel = SubmissionViewModel();

  final SubmissionLinkViewModel submissionLinkViewModel =
      SubmissionLinkViewModel();

  final ChoiceQuestionAnswerViewModel choiceQuestionAnswerViewModel =
      ChoiceQuestionAnswerViewModel();

  final ConcretisationsViewModel concretisationsViewModel =
      ConcretisationsViewModel();

  ViewModel() {
    surveyViewModel.vm = this;
    submissionViewModel.vm = this;
    submissionLinkViewModel.vm = this;
    choiceQuestionAnswerViewModel.vm = this;
    concretisationsViewModel.vm = this;
  }
}

class SurveyViewModel {
  late ViewModel vm;

  final Map<int, Survey> byId = {};

  final BehaviorSubject changed = BehaviorSubject.seeded(true);
  DateTime _lastUpdateTimeStamp = DateTime.now();

  DateTime get lastUpdateTimeStamp => _lastUpdateTimeStamp;

  void add(Iterable<Survey> surveyTypes) {
    byId.addAll({for (var survey in surveyTypes) survey.id: survey});

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }

  void update(Iterable<Survey> surveys) {
    byId.addAll({for (var survey in surveys) survey.id: survey});

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }

  void clear() {
    byId.clear();

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }
}

extension SurveyExtension on Survey {
  Iterable<Submission> getSubmissions(ViewModel vm) {
    return vm.submissionViewModel.bySurvey[this]?.values ?? [];
  }

  Iterable<Submission> get submissions =>
      getSubmissions(GetIt.I.get<ViewModel>());
}

class SubmissionViewModel {
  late ViewModel vm;

  final Map<int, Submission> byId = {};
  final Map<Survey, Map<int, Submission>> bySurvey = {};

  final BehaviorSubject changed = BehaviorSubject.seeded(true);

  DateTime _lastUpdateTimeStamp = DateTime.now();

  DateTime get lastUpdateTimeStamp => _lastUpdateTimeStamp;

  Set<Submission> getFilteredSubmissions(
      {required Iterable<String> filterByUsers,
      required Map<ChoiceQuestion, Iterable<String?>> filterByAttributes,
      required String filterByName}) {
    final filteredSubmissions = byId.values
        .where(
            (s) => filterByUsers.isEmpty || filterByUsers.contains(s.createdBy))
        .where((s) => filterByAttributes.keys.every((question) {
              final cqas = vm.choiceQuestionAnswerViewModel.byId.values
                  .where((cqa) => s.id == cqa.submissionId)
                  .toSet();

              if (filterByAttributes[question]?.isEmpty == true) {
                return true;
              }

              final filteredQuestionValues =
                  cqas.where((cqa) => cqa.question == question.id);
              if (filteredQuestionValues.isEmpty) {
                return filterByAttributes[question]!.contains(null);
              }

              return filteredQuestionValues.any((answer) =>
                  filterByAttributes[question]!.contains(answer.answer));
            }))
        .where(
            (s) => s.title.toLowerCase().contains(filterByName.toLowerCase()))
        .toSet();

    return filteredSubmissions;
  }

  void update(Iterable<Submission> submissions) {
    byId.addAll(
        {for (var submission in submissions) submission.id: submission});

    for (final submission in submissions) {
      bySurvey.putIfAbsent(
              submission.survey, () => <int, Submission>{})[submission.id] =
          submission;
    }

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }

  void remove(Iterable<Submission> submissions) {
    for (final submission in submissions) {
      byId.remove(submission.id);
      bySurvey[submission.survey]?.remove(submission.id);
    }

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }

  void clear() {
    byId.clear();
    bySurvey.clear();

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }
}

extension SubmissionExtension on Submission {
  Iterable<ChoiceQuestionAnswer> getAnswers(
      {required ViewModel vm, required SurveyEntryPath? path}) {
    if (path == null) {
      return {};
    }

    final choiceQuestionAnswersByPath =
        vm.choiceQuestionAnswerViewModel.bySubmissionAndPath[this];

    if (choiceQuestionAnswersByPath == null) {
      return {};
    }

    if (path.isChoicePath) {
      final choicePath = path;

      final questionPath = path.parentPath;

      final answers = choiceQuestionAnswersByPath[questionPath]?.values ?? {};

      return answers
          .where((answer) => answer.answer == choicePath.leafAnswer)
          .toSet();
    }

    final answers = choiceQuestionAnswersByPath[path]?.values ?? {};

    return answers;
  }

  Map<SurveyEntryPath, Map<int, ChoiceQuestionAnswer>> get answersByPath =>
      getAnswersByPath(GetIt.I.get<ViewModel>());

  Map<SurveyEntryPath, Map<int, ChoiceQuestionAnswer>> getAnswersByPath(
          ViewModel vm) =>
      vm.choiceQuestionAnswerViewModel.bySubmissionAndPath[this] ?? {};

  Survey get survey => getSurvey(GetIt.I.get<ViewModel>());

  Survey getSurvey(ViewModel vm) => vm.surveyViewModel.byId[surveyId]!;

  Set<Submission> get parentsRecursivly =>
      getParentsRecursivly(GetIt.I.get<ViewModel>());

  Set<Submission> getParentsRecursivly(ViewModel vm) {
    final submissionsToFindParentsFor = Queue<Submission>()..add(this);

    final allParents = <Submission>{};

    while (submissionsToFindParentsFor.isNotEmpty) {
      final submissionToFindParentsFor =
          submissionsToFindParentsFor.removeFirst();
      final parents = submissionToFindParentsFor.getParents(vm);
      submissionsToFindParentsFor.addAll(parents);
      allParents.addAll(parents);
    }

    return allParents;
  }

  Set<Submission> get parents => getParents(GetIt.I.get<ViewModel>());

  Set<Submission> getParents(ViewModel vm) {
    final parentLinks = vm.submissionLinkViewModel.byChildId[id];
    if (parentLinks == null) {
      return {};
    }

    return parentLinks
        .map((l) => vm.submissionViewModel.byId[l.parentId])
        .whereNotNull()
        .toSet();
  }

  Set<Submission> get children {
    return getChildren(GetIt.I.get<ViewModel>());
  }

  Set<Submission> getChildren(ViewModel vm) {
    final childrenLinks = vm.submissionLinkViewModel.byParentId[id];
    if (childrenLinks == null) {
      return {};
    }

    return childrenLinks
        .map((l) => vm.submissionViewModel.byId[l.childId])
        .whereNotNull()
        .toSet();
  }
}

class SubmissionLinkViewModel {
  late ViewModel vm;

  final BehaviorSubject changed = BehaviorSubject.seeded(true);

  DateTime _lastUpdateTimeStamp = DateTime.now();

  DateTime get lastUpdateTimeStamp => _lastUpdateTimeStamp;

  Map<int, SubmissionLink> byId = {};

  Map<int, Set<SubmissionLink>> byChildId = {};

  Map<int, Set<SubmissionLink>> byParentId = {};

  void update(Iterable<SubmissionLink> submissionLinks) {
    for (final submissionLink in submissionLinks) {
      byChildId
          .putIfAbsent(submissionLink.childId, () => {})
          .add(submissionLink);
      byParentId
          .putIfAbsent(submissionLink.parentId, () => {})
          .add(submissionLink);
      byId[submissionLink.id] = submissionLink;
    }

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }

  void remove(Iterable<SubmissionLink> submissionLinks) {
    for (final submissionLink in submissionLinks) {
      byChildId[submissionLink.childId]?.remove(submissionLink);
      if (byChildId[submissionLink.childId]?.isEmpty == true) {
        byChildId.remove(submissionLink.childId);
      }

      byParentId[submissionLink.parentId]?.remove(submissionLink);
      if (byParentId[submissionLink.parentId]?.isEmpty == true) {
        byParentId.remove(submissionLink.parentId);
      }

      byId.remove(submissionLink.id);
    }

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }

  void clear() {
    byId.clear();
    byChildId.clear();
    byParentId.clear();

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }
}

class ChoiceQuestionAnswerViewModel {
  late ViewModel vm;

  ChoiceQuestionAnswerViewModel();

  final BehaviorSubject changed = BehaviorSubject.seeded(true);

  DateTime _lastUpdateTimeStamp = DateTime.now();

  DateTime get lastUpdateTimeStamp => _lastUpdateTimeStamp;

  final Map<int, ChoiceQuestionAnswer> byId = {};
  final Map<int, ChoiceQuestionAnswer> byParentId = {};

  final bySubmissionAndPath =
      <Submission, Map<SurveyEntryPath, Map<int, ChoiceQuestionAnswer>>>{};

  Iterable<ChoiceQuestionAnswer> answersForSubmissions(
          Iterable<Submission> submissions) =>
      {
        for (final submission in submissions)
          ...answersForSubmission(submission),
      };

  Iterable<ChoiceQuestionAnswer> answersForSubmission(Submission submission) =>
      bySubmissionAndPath[submission]
          ?.values
          .expand((answerKeyValuePairs) => answerKeyValuePairs.values) ??
      const Iterable<ChoiceQuestionAnswer>.empty();

  void update(Iterable<ChoiceQuestionAnswer> choiceAnswers) {
    byId.addAll({
      for (var choiceAnswer in choiceAnswers) choiceAnswer.id: choiceAnswer
    });

    byParentId.addAll({
      for (var choiceAnswer
          in choiceAnswers.where((answer) => answer.parentId != null))
        choiceAnswer.parentId!: choiceAnswer
    });

    for (var answer in choiceAnswers) {
      final pathForAnswer = getPathForAnswer(answer);
      final pathForQuestion = pathForAnswer.parentPath!;

      final submission = GetIt.I
          .get<ViewModel>()
          .submissionViewModel
          .byId[answer.submissionId]!;

      final answersByPath =
          bySubmissionAndPath.putIfAbsent(submission, () => {});

      answersByPath.putIfAbsent(pathForQuestion, () => {})[answer.id] = answer;
    }

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }

  void remove(Iterable<ChoiceQuestionAnswer> choiceAnswers) {
    final subquestionAnswers =
        choiceAnswers.expand((a) => a.getSubquestionAnswersRecursivly(vm));
    final answersToRemove = {...choiceAnswers, ...subquestionAnswers};

    for (var answer in answersToRemove) {
      final pathForAnswer = getPathForAnswer(answer);
      final pathForQuestion = pathForAnswer.parentPath!;

      final submission = vm.submissionViewModel.byId[answer.submissionId]!;

      final answersByPath = bySubmissionAndPath[submission];

      if (answersByPath == null) {
        continue;
      }

      final answersForPath = answersByPath[pathForQuestion];
      if (answersForPath == null) {
        assert(false);
        continue;
      }

      answersForPath.remove(answer.id);
      if (answersForPath.isEmpty) {
        answersByPath.remove(pathForQuestion);
      }
    }
    for (var choiceAnswer in answersToRemove) {
      byId.remove(choiceAnswer.id);
    }

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }

  SurveyEntryPath getPathForAnswer(ChoiceQuestionAnswer element) {
    final serveyEntryPathElements = Queue<SurveyEntryPathElement>();

    ChoiceQuestionAnswer? answer = element;

    while (answer != null) {
      final questionCode = answer.question;
      final answerCode = answer.answer;

      serveyEntryPathElements.addFirst(SurveyEntryPathElement((b) => b
        ..question = questionCode
        ..answer = answerCode));

      answer = byId[answer.parentId];
    }

    return SurveyEntryPath(
        (b) => b..chainElements = ListBuilder(serveyEntryPathElements));
  }

  void clear() {
    byId.clear();
    byParentId.clear();
    bySubmissionAndPath.clear();

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }
}

extension ChoiceQuestionAnswerExtension on ChoiceQuestionAnswer {
  Iterable<Concretisation> get concretisations =>
      getConcretisations(GetIt.I.get<ViewModel>());

  Iterable<Concretisation> getConcretisations(ViewModel vm) {
    final concretisationsAnswer =
        vm.concretisationsViewModel.concretisationsByChoiceQuestionAnswer;
    final concretisations = concretisationsAnswer[this]?.values ?? {};
    return concretisations;
  }

  Submission get submission => getSubmission(GetIt.I.get<ViewModel>());

  Submission getSubmission(ViewModel vm) =>
      vm.submissionViewModel.byId[submissionId]!;

  Submission get linkedSubmission =>
      getLinkedSubmission(GetIt.I.get<ViewModel>());

  Submission getLinkedSubmission(ViewModel vm) =>
      vm.submissionViewModel.byId[linkedSubmissionId]!;

  bool get isInherited => linkedSubmissionId != submission.id;

  Set<ChoiceQuestionAnswer> getParentAnsersRecursivly(
      {required ViewModel vm, required SurveyEntryPath? path}) {
    final parentAnswers = getSubmission(vm)
        .getParentsRecursivly(vm)
        .expand((parent) => parent.getAnswers(vm: vm, path: path));
    return parentAnswers.toSet();
  }

  Set<ChoiceQuestionAnswer> getParentAnsers(
      {required ViewModel vm, required SurveyEntryPath? path}) {
    final parentAnswers = getSubmission(vm)
        .getParents(vm)
        .expand((parent) => parent.getAnswers(vm: vm, path: path));
    return parentAnswers.toSet();
  }

  Set<ChoiceQuestionAnswer> get subquestionAnswers =>
      getSubquestionAnswers(GetIt.I.get<ViewModel>());

  Set<ChoiceQuestionAnswer> getSubquestionAnswers(ViewModel vm) =>
      vm.choiceQuestionAnswerViewModel.byId.values
          .where((c) => c.parentId == id)
          .toSet();

  Set<ChoiceQuestionAnswer> getSubquestionAnswersRecursivly(ViewModel vm) {
    final answersToFindSubquestionAnswersFor = Queue<ChoiceQuestionAnswer>()
      ..add(this);

    final subquestionAnswers = <ChoiceQuestionAnswer>{};

    while (answersToFindSubquestionAnswersFor.isNotEmpty) {
      final answerToFindSubquestionAnswersFor =
          answersToFindSubquestionAnswersFor.removeFirst();
      final subquestionAnswer =
          answerToFindSubquestionAnswersFor.getSubquestionAnswers(vm);
      answersToFindSubquestionAnswersFor.addAll(subquestionAnswer);
      subquestionAnswers.addAll(subquestionAnswer);
    }

    return subquestionAnswers;
  }

  ChoiceQuestionAnswer? getLinkedChoiceQuestionAnswer(ViewModel vm,
      {required SurveyEntryPath choicePath}) {
    final thisCqasSurvey = getSubmission(vm);
    final linkedSubmission = getLinkedSubmission(vm);
    final linkedChoiceQuestionAnswer =
        linkedSubmission.getAnswers(vm: vm, path: choicePath);

    final linkedButNotOwnedByItself = linkedChoiceQuestionAnswer
        .where((cqa) => !cqa.isOwnedBySubmission(thisCqasSurvey));
    return linkedButNotOwnedByItself.firstOrNull;
  }
}

class ConcretisationsViewModel {
  late ViewModel vm;

  final Map<int, Concretisation> byId = {};

  final Map<ChoiceQuestionAnswer, Map<int, Concretisation>>
      concretisationsByChoiceQuestionAnswer =
      <ChoiceQuestionAnswer, Map<int, Concretisation>>{};

  final BehaviorSubject changed = BehaviorSubject.seeded(true);

  DateTime _lastUpdateTimeStamp = DateTime.now();

  DateTime get lastUpdateTimeStamp => _lastUpdateTimeStamp;

  void update(Iterable<Concretisation> concretisations) {
    byId.addAll({
      for (final concretisation in concretisations)
        concretisation.id: concretisation
    });

    for (final concretisation in concretisations) {
      final parentAnswer = vm.choiceQuestionAnswerViewModel
          .byId[concretisation.choiceQuestionAnswerId]!;
      concretisationsByChoiceQuestionAnswer.putIfAbsent(
          parentAnswer, () => {})[concretisation.id] = concretisation;
    }

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }

  void remove(BuiltList<Concretisation> concretisations) {
    for (var concretisation in concretisations) {
      final choiceQuestionAnswer = vm.choiceQuestionAnswerViewModel
          .byId[concretisation.choiceQuestionAnswerId]!;

      var concretisationsForAnswer =
          concretisationsByChoiceQuestionAnswer[choiceQuestionAnswer]!;
      concretisationsForAnswer.remove(concretisation.id);

      if (concretisationsForAnswer.isEmpty) {
        concretisationsByChoiceQuestionAnswer.remove(choiceQuestionAnswer);
      }
    }
    for (final concretisation in concretisations) {
      byId.remove(concretisation.id);
    }

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }

  void clear() {
    byId.clear();
    concretisationsByChoiceQuestionAnswer.clear();

    _lastUpdateTimeStamp = DateTime.now();
    changed.add(true);
  }
}
