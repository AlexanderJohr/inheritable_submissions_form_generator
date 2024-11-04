import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:json_to_survey/src/value_types/disableable_extensions.dart';
import 'package:json_to_survey/src/store/store.dart';
import 'package:json_to_survey/src/view_model/view_models.dart';
import 'package:json_to_survey/src/value_types/survey.dart';

class TreeTraverseStackElement {
  final SurveyEntryPath path;
  bool get disabled => disabledPathSegments.isNotEmpty;
  final List<SurveyEntryPath> disabledPathSegments;
  final List<SurveyEntryPath> pathSegments;

  bool get unchecked => uncheckedChoicePathSegments.isNotEmpty;
  final List<SurveyEntryPath> uncheckedChoicePathSegments;

  TreeTraverseStackElement(
      {required this.path,
      required this.pathSegments,
      required this.disabledPathSegments,
      required this.uncheckedChoicePathSegments});
}

extension SubmissionExtensions on Submission {
  ChoiceAnswerValidationResult validate(ViewModel vm) {
    final parents = getParentsRecursivly(vm);

    BuiltSet<String> getDependentFieldValues(String field) {
      final fieldPath = SurveyEntryPath((b) => b.leafQuestion = field);
      final valuesForField = getAnswers(vm: vm, path: fieldPath);

      return valuesForField.map((v) => v.answer).toBuiltSet();
    }

    final type = getSurvey(vm);

    final questionsAndChoicesByPath = type.questionsAndChoicesByPath;
    final questionByPathMap = questionsAndChoicesByPath.questionByPathMap;
    final choicesByPathMap = questionsAndChoicesByPath.choicesByPathMap;

    final questionErrorByPath =
        <SurveyEntryPath, BuiltList<QuestionError>>{};

    final structure = type.structure;

    final pathQueue =
        Queue<TreeTraverseStackElement>.from(structure.questions.map((e) {
      final resolvedQuestion = e.resolveConcreteQuestion(type);
      final path = SurveyEntryPath(
          (b) => b.leafQuestion = e.resolveConcreteQuestion(type).id);

      final isDisabled = resolvedQuestion.isDisabled(getDependentFieldValues);

      return TreeTraverseStackElement(
          path: path,
          pathSegments: [path],
          disabledPathSegments: [if (isDisabled) path],
          uncheckedChoicePathSegments: []);
    }));

    while (pathQueue.isNotEmpty) {
      final treeTraverseStackElement = pathQueue.removeFirst();

      final path = treeTraverseStackElement.path;

      if (path.isTopLevelQuestionPath || path.isSubQuestionPath) {
        final question = questionByPathMap[path]!;

        if (treeTraverseStackElement.disabled) {
          final ownAnswers = getAnswers(vm: vm, path: path);

          final parentAnswers =
              parents.expand((p) => p.getAnswers(vm: vm, path: path));
          // TODO: remove?
          final allAnswers = {...ownAnswers, ...parentAnswers};

          if (ownAnswers.isNotEmpty) {
            final error = ChoiceQuestionHasAnswersButPathIsDisabledError((b) =>
                b
                  ..questionTitle = question.title
                  ..pathSegments = treeTraverseStackElement.pathSegments
                      .toBuiltList()
                      .toBuilder()
                  ..disabledPathSegments = treeTraverseStackElement
                      .disabledPathSegments
                      .toBuiltList()
                      .toBuilder());

            for (var errorPath in path.questionPathChain) {
              questionErrorByPath.update(
                  errorPath, (set) => set.rebuild((b) => b.add(error)),
                  ifAbsent: () => BuiltList([error]));
            }

            final disabledQuestion = treeTraverseStackElement
                .disabledPathSegments.first
                .getQuestion(questionsAndChoicesByPath);

            final disabledChoice = treeTraverseStackElement
                .disabledPathSegments.first
                .getChoice(questionsAndChoicesByPath);

            SurveyEntryPath disabledQuestionPath() {
              if (disabledQuestion != null) {
                return treeTraverseStackElement.disabledPathSegments.first;
              }
              if (disabledChoice != null) {
                return treeTraverseStackElement
                    .disabledPathSegments.first.parentPath!;
              }
              throw AssertionError();
            }

            final parentPathError = PathIsDisabledButHasAnsweredSubquestionsError((b) =>
                b
                  ..pathSegments = treeTraverseStackElement.pathSegments
                      .toBuiltList()
                      .toBuilder()
                  ..disabledPathSegments = treeTraverseStackElement
                      .disabledPathSegments
                      .toBuiltList()
                      .toBuilder()
                  ..subQuestionPath = path.toBuilder()
                  ..questionTitle =
                      disabledQuestion?.title ?? disabledChoice?.title);

            for (var errorPath in disabledQuestionPath().questionPathChain) {
              questionErrorByPath.update(
                  errorPath, (set) => set.rebuild((b) => b.add(parentPathError)),
                  ifAbsent: () => BuiltList([parentPathError]));
            }
          }
        }

        if (question is ChoiceQuestion) {
          final ownAnswers = getAnswers(vm: vm, path: path);

          if (treeTraverseStackElement.disabledPathSegments.isEmpty &&
              ownAnswers.isEmpty &&
              treeTraverseStackElement.uncheckedChoicePathSegments.isEmpty) {
            final error = ChoiceQuestionHasNoAnswersError((b) => b
              ..questionTitle = question.title
              ..pathSegments = treeTraverseStackElement.pathSegments
                  .toBuiltList()
                  .toBuilder());

            for (var errorPath in path.questionPathChain) {
              questionErrorByPath.update(
                  errorPath, (set) => set.rebuild((b) => b.add(error)),
                  ifAbsent: () => BuiltList([error]));
            }
          }

          if (ownAnswers.length > 1 && question is SingleChoiceQuestion) {
            final error = SingelChoiceQuestionHasToManyAnswersError((b) => b
              ..questionTitle = question.title
              ..pathSegments = treeTraverseStackElement.pathSegments
                  .toBuiltList()
                  .toBuilder());

            for (var errorPath in path.questionPathChain) {
              questionErrorByPath.update(
                  errorPath, (set) => set.rebuild((b) => b.add(error)),
                  ifAbsent: () => BuiltList([error]));
            }
          }

          final duplicates = ownAnswers
              .where((answer) => ownAnswers.any((otherAnswer) =>
                  answer != otherAnswer && answer.answer == otherAnswer.answer))
              .toSet();

          if (duplicates.isNotEmpty) {
            final error = ChoiceQuestionHasDuplicateAnswersError((b) => b
              ..questionTitle = question.title
              ..duplicateAnswers = duplicates
                  .map((a) =>
                      question.choices
                          .singleWhereOrNull((c) => c.value == a.answer)
                          ?.title ??
                      a.answer)
                  .toBuiltSet()
                  .toBuilder()
              ..pathSegments = treeTraverseStackElement.pathSegments
                  .toBuiltList()
                  .toBuilder());

            for (var errorPath in path.questionPathChain) {
              questionErrorByPath.update(
                  errorPath, (set) => set.rebuild((b) => b.add(error)),
                  ifAbsent: () => BuiltList({error}));
            }
          }

          final choices = question.choices;

          for (var choice in choices) {
            final choicePath = path.rebuild((b) => b
              ..chainElements.add(SurveyEntryPathElement((b) => b
                ..question = path.leafQuestion
                ..answer = choice.value))
              ..leafQuestion = null);

            final choiceDisabled = treeTraverseStackElement.disabled ||
                choice.isDisabled(getDependentFieldValues);

            final ownAnswer =
                getAnswers(vm: vm, path: choicePath).singleOrNull;

            final choiceIsUnchecked = ownAnswer == null;

            final subQuestionTreeTraverseStackElement =
                TreeTraverseStackElement(path: choicePath, pathSegments: [
              ...treeTraverseStackElement.pathSegments,
              choicePath
            ], disabledPathSegments: [
              ...treeTraverseStackElement.disabledPathSegments,
              if (choiceDisabled) choicePath
            ], uncheckedChoicePathSegments: [
              ...treeTraverseStackElement.uncheckedChoicePathSegments,
              if (choiceIsUnchecked) choicePath
            ]);

            pathQueue.add(subQuestionTreeTraverseStackElement);
          }
        }
      } else if (path.isChoicePath) {
        final choice = choicesByPathMap[path]!;

        final subQuestions = choice.subQuestions;

        for (var subQuestion in subQuestions) {
          final resolvedSubQuestion = subQuestion.resolveConcreteQuestion(type);
          final subQuestionPath =
              path.rebuild((b) => b.leafQuestion = resolvedSubQuestion.id);

          final isDisabled =
              resolvedSubQuestion.isDisabled(getDependentFieldValues);

          final subQuestionTreeTraverseStackElement =
              TreeTraverseStackElement(path: subQuestionPath, pathSegments: [
            ...treeTraverseStackElement.pathSegments,
            subQuestionPath
          ], disabledPathSegments: [
            ...treeTraverseStackElement.disabledPathSegments,
            if (isDisabled) subQuestionPath
          ], uncheckedChoicePathSegments: [
            ...treeTraverseStackElement.uncheckedChoicePathSegments,
          ]);

          pathQueue.add(subQuestionTreeTraverseStackElement);
        }
      }
    }

    return ChoiceAnswerValidationResult((b) => b
      ..errorsByPath =
          BuiltMap<SurveyEntryPath, BuiltList<QuestionError>>(
                  questionErrorByPath)
              .toBuilder());
  }

}
