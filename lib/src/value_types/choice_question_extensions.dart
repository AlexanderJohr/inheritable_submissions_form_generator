import 'dart:collection';

import 'package:json_to_survey/src/value_types/survey.dart';

extension ChoiceQuestionExtensions on ChoiceQuestion {
  Iterable<ChoiceQuestion> extractSubquestionsRecursive() {
    final allSubquestions = [this];

    final questionQueue = Queue<ChoiceQuestion>.from([this]);

    while (questionQueue.isNotEmpty) {
      final question = questionQueue.removeFirst();

      final subQuestions = question.extractDirectSubquestions();

      allSubquestions.add(question);
    }

    return allSubquestions;
  }

  Iterable<ChoiceQuestion> extractDirectSubquestions() =>
      choices.map((choice) => choice.subQuestions).whereType<ChoiceQuestion>();
}
