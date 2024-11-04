import 'package:json_to_survey/model.dart';
import 'package:json_to_survey/view_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:collection/collection.dart';

class ChoiceFilterService {
  //FilterMode _filterMode = FilterMode.containsAnyOf;

  FilterMode getFilterMode(ChoiceQuestion question) =>
      _filterMode[question] ?? FilterMode.containsAnyOf;

  Map<ChoiceQuestion, FilterMode> _filterMode = {};

  setFilterMode(ChoiceQuestion question, FilterMode value) {
    _filterMode[question] = value;
    changed.add(true);
  }

  Map<ChoiceQuestion, Map<String, bool>> filter = {};
  final BehaviorSubject changed = BehaviorSubject();

  setFilter(
      {required ChoiceQuestion question,
      required String answer,
      required bool selected}) {
    filter.putIfAbsent(question, () => {})[answer] = selected;
    changed.add(true);
  }

  String filterLabel(ChoiceQuestion question) {
    final includedAnswers = includedAnswersByFilter(question);
    final excludedAnswers = excludedAnswersByFilter(question);

    final label = switch (getFilterMode(question)) {
      FilterMode.containsAnyOf => excludedAnswers.length.toString(),
      FilterMode.containsExactly => includedAnswers.length.toString(),
    };

    return label;
  }

  Set<String> includedAnswersByFilter(ChoiceQuestion id) {
    Set filteredOutAnswers = excludedAnswersByFilter(id);
    final allChoices = {
      ...id.choices.map((choice) => choice.value).toSet(),
      "\"\""
    };
    final remainingAnswers = allChoices.difference(filteredOutAnswers);
    return remainingAnswers;
  }

  Set<String> excludedAnswersByFilter(ChoiceQuestion filteredQuestion) =>
      filter[filteredQuestion]
          ?.entries
          .where((entry) => entry.value == false)
          .map((entry) => entry.key)
          .toSet() ??
      {};

  bool atLeastOneAnswerIsFilteredOut(
      {required ChoiceQuestion question, required Set<String> answers}) {
    final includedAnswers = includedAnswersByFilter(question);
    return !SetEquality().equals(includedAnswers, answers);
  }

  bool allAnswersAreFilteredOut(
      {required ChoiceQuestion question, required Set<String> answers}) {
    Set filteredOutAnswers = excludedAnswersByFilter(question);

    final allAnswersAreFilteredOut =
        answers.difference(filteredOutAnswers).isEmpty;

    return allAnswersAreFilteredOut;
  }

  showFilterCountLabel(ChoiceQuestion question) {
    final includedAnswers = includedAnswersByFilter(question);
    final excludedAnswers = excludedAnswersByFilter(question);

    final showLabel = switch (getFilterMode(question)) {
      FilterMode.containsAnyOf => excludedAnswers.isNotEmpty,
      FilterMode.containsExactly =>
        includedAnswers.isNotEmpty || (filter[question]?['""'] ?? false),
    };

    return showLabel;
  }

  bool filterSubmissionOut(ChoiceQuestion question, Set<String> answerValues) =>
      switch (getFilterMode(question)) {
        FilterMode.containsAnyOf =>
          allAnswersAreFilteredOut(question: question, answers: answerValues),
        FilterMode.containsExactly => atLeastOneAnswerIsFilteredOut(
            question: question, answers: answerValues)
      };

  List<Submission> getFilteredSubmissions(Iterable<Submission> submissions) {
    final filteredQuestions = {..._filterMode.keys, ...filter.keys};

    return submissions.where((submission) {
      for (final filteredQuestion in filteredQuestions) {
        final topLevelPath =
            SurveyEntryPath((b) => b..leafQuestion = filteredQuestion.id);
        final answers = submission.answersByPath[topLevelPath]?.values ?? [];

        final answerValues = {
          ...answers.map((answer) => answer.answer).toSet(),
          if (answers.isEmpty) "\"\""
        };

        if (filterSubmissionOut(filteredQuestion, answerValues)) {
          return false;
        }
      }

      return true;
    }).toList();
  }
}

enum FilterMode {
  containsAnyOf,
  containsExactly,
}
