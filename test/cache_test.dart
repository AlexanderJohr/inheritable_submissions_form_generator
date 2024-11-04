import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:example_data/example_data.dart' as exampleData;
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:json_to_survey/src/value_types/survey.dart';

void main() {
  group('Cache Test', () {
    test('Cache Test', () async {
      GetIt.I.registerSingleton<SurveyCache>(SurveyCache());
      GetIt.I.registerSingleton<SubmissionCache>(SubmissionCache());
      GetIt.I.registerSingleton<ChoiceQuestionAnswerCache>(
          ChoiceQuestionAnswerCache());

      final Survey survey = Survey.fromJson(exampleData.survey)!;

      GetIt.I.get<SurveyCache>().update([survey]);

      final submissions = exampleData.submissions
          .map((submission) => Submission.fromJson(submission))
          .whereNotNull()
          .toList();

      GetIt.I.get<SubmissionCache>().update(submissions);

      final choiceQuestionAnswers = exampleData.choiceQuestionAnswers
          .map((answer) => ChoiceQuestionAnswer.fromJson(answer))
          .whereNotNull()
          .toList();

      GetIt.I.get<ChoiceQuestionAnswerCache>().update(choiceQuestionAnswers);

      expect(true, isTrue);
    });
  });
}

class SurveyCache {
  final Map<int, Survey> byId = {};

  void update(Iterable<Survey> surveys) {
    byId.addAll({for (var survey in surveys) survey.id: survey});
  }
}

class SubmissionCache {
  final Map<int, Submission> byId = {};

  void update(Iterable<Submission> submissions) {
    byId.addAll(
        {for (var submission in submissions) submission.id: submission});
  }
}

class ChoiceQuestionAnswerCache {
  final Map<int, ChoiceQuestionAnswer> byId = {};
  final bySubmissionAndPath =
      <Submission, Map<SurveyEntryPath, Map<int, ChoiceQuestionAnswer>>>{};

  void update(Iterable<ChoiceQuestionAnswer> choiceAnswers) {
    byId.addAll({
      for (var choiceAnswer in choiceAnswers) choiceAnswer.id: choiceAnswer
    });

    for (var answer in choiceAnswers) {
      final pathForAnswer = getPathForElement2(answer);
      final pathForQuestion = pathForAnswer.parentPath!;

      final submission =
          GetIt.I.get<SubmissionCache>().byId[answer.submissionId]!;

      final answersByPath =
          bySubmissionAndPath.putIfAbsent(submission, () => {});

      answersByPath.putIfAbsent(pathForAnswer, () => {})[answer.id] = answer;
      answersByPath.putIfAbsent(pathForQuestion, () => {})[answer.id] = answer;
    }
  }
}

SurveyEntryPath getPathForElement2(ChoiceQuestionAnswer element) {
  final serveyEntryPathElements = Queue<SurveyEntryPathElement>();

  ChoiceQuestionAnswer? answer = element;

  while (answer != null) {
    final questionCode = answer.question;
    final answerCode = answer.answer;

    serveyEntryPathElements.addFirst(SurveyEntryPathElement((b) => b
      ..question = questionCode
      ..answer = answerCode));

    answer = GetIt.I.get<ChoiceQuestionAnswerCache>().byId[answer.parentId];
  }

  return SurveyEntryPath(
      (b) => b..chainElements = ListBuilder(serveyEntryPathElements));
}
