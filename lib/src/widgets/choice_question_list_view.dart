import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:json_to_survey/src/value_types/survey.dart';

import '../view_model/view_models.dart';
import 'choice_list_tile.dart';

class ChoiceQuestionListView extends StatelessWidget {
  final SurveyEntryPath path;
  final ChoiceQuestion question;
  final Submission submission;
  final OnUpdateChoiceQuestionAnswer onUpdateChoiceQuestionAnswer;
  final ViewModel vm;

  const ChoiceQuestionListView(
      {super.key,
      required this.question,
      required this.path,
      required this.submission,
      required this.onUpdateChoiceQuestionAnswer,
      required this.vm});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: vm.choiceQuestionAnswerViewModel.changed
            .map((_) => submission.getAnswers(vm: vm, path: path))
            .distinct(),
        builder: (context, snapshot) {
          final thisSubmissionsSelectedChoices =
              submission.getAnswers(vm: vm, path: path);

          final parents = submission.getParentsRecursivly(  vm);
          final parentsSelectedChoices =
              parents.expand((p) => p.getAnswers(vm: vm, path: path));

          final selectedChoices = [
            ...thisSubmissionsSelectedChoices,
            ...parentsSelectedChoices
          ];

          final thisSubmissionsLinks = vm.submissionLinkViewModel.byId
               .values
              .where((l) => l.childId == submission.id);

          Set<Choice> selectedAndSelectableChoices = {};
          Set<Choice> unselectableChoices = {};

          final inheritedSelectedChoices = selectedChoices
              .where((choiceAnswer) =>
                  choiceAnswer.linkedSubmissionId !=
                      choiceAnswer.submissionId &&
                  submission.id == choiceAnswer.submissionId)
              .toList();

          final inheritableSelectedChoices = selectedChoices
              .where((choiceAnswer) =>
                  submission.id != choiceAnswer.submissionId &&
                  thisSubmissionsLinks
                      .any((l) => l.parentId == choiceAnswer.submissionId) &&
                  inheritedSelectedChoices
                      .none((icqa) => icqa.answer == choiceAnswer.answer))
              .toList();

          final ownSelectedChoices = selectedChoices
              .where((choiceAnswer) =>
                  choiceAnswer.linkedSubmissionId ==
                      choiceAnswer.submissionId &&
                  submission.id == choiceAnswer.submissionId)
              .toList();

          final ownSelectedButAnswerNotPresent = ownSelectedChoices
              .where((choiceAnswer) => !question.choices
                  .map((choice) => choice.value)
                  .contains(choiceAnswer.answer))
              .toList();

          for (Choice c in question.choices) {
            final choiceIsInherited =
                inheritedSelectedChoices.any((cqa) => cqa.answer == c.value);
            final choiceIsNotSelectedInItsOwnSubmission =
                ownSelectedChoices.none((cqa) => cqa.answer == c.value);

            if (choiceIsInherited && choiceIsNotSelectedInItsOwnSubmission) {
              continue;
            }

            final enabledIf = c.enabledIf;

            final enabled = enabledIf == null ||
                enabledIf.check((field) {
                  final path = SurveyEntryPath((b) => b.leafQuestion = field);
                  final valuesForField =
                      submission.getAnswers(vm: vm, path: path);

                  return valuesForField.map((v) => v.answer).toBuiltSet();
                });

            final choiceIsSelected =
                selectedChoices.any((cqa) => cqa.answer == c.value);

            if (choiceIsSelected || enabled) {
              selectedAndSelectableChoices.add(c);
            } else {
              unselectableChoices.add(c);
            }
          }

          return ListView(children: [
            for (ChoiceQuestionAnswer cqa in inheritableSelectedChoices)
              ChoiceListTile(
                  questionPath: path,
                  question: question,
                  selectedChoice: question.choices.singleWhereOrNull(
                      (choice) => choice.value == cqa.answer),
                  choiceQuestionAnswer: cqa,
                  onUpdateChoiceQuestionAnswer: onUpdateChoiceQuestionAnswer),
            for (ChoiceQuestionAnswer cqa in inheritedSelectedChoices)
              ChoiceListTile(
                  questionPath: path,
                  question: question,
                  selectedChoice: question.choices.singleWhereOrNull(
                      (choice) => choice.value == cqa.answer),
                  choiceQuestionAnswer: cqa,
                  onUpdateChoiceQuestionAnswer: onUpdateChoiceQuestionAnswer),
            for (Choice c in selectedAndSelectableChoices)
              ChoiceListTile(
                  questionPath: path,
                  question: question,
                  selectedChoice: c,
                  choiceQuestionAnswer: ownSelectedChoices
                      .singleWhereOrNull((cqa) => cqa.answer == c.value),
                  onUpdateChoiceQuestionAnswer: onUpdateChoiceQuestionAnswer),
            for (Choice c in unselectableChoices)
              ChoiceListTile(
                  questionPath: path,
                  question: question,
                  selectedChoice: c,
                  choiceQuestionAnswer: ownSelectedChoices
                      .singleWhereOrNull((cqa) => cqa.answer == c.value),
                  onUpdateChoiceQuestionAnswer: onUpdateChoiceQuestionAnswer),
            for (ChoiceQuestionAnswer cqa in ownSelectedButAnswerNotPresent)
              ChoiceListTile(
                  questionPath: path,
                  question: question,
                  selectedChoice: null,
                  choiceQuestionAnswer: cqa,
                  onUpdateChoiceQuestionAnswer: onUpdateChoiceQuestionAnswer)
          ]);
        });
  }
}
