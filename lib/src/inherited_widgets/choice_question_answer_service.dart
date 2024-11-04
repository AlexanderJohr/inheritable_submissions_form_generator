
import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../dialogs/confirm_dialog.dart';
import '../dialogs/delete_inherited_answer_operation_dialog.dart';
import '../dialogs/inherited_answer_operation_dialog.dart';
import '../store/store.dart';
import '../view_model/view_models.dart';
import '../value_types/survey.dart';

class ChoiceQuestionAnswerService extends InheritedWidget {
  final Submission submission;

  const ChoiceQuestionAnswerService(
      {Key? key,
        required Widget child,
         required this.submission})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static ChoiceQuestionAnswerService of(BuildContext context) {
    final ChoiceQuestionAnswerService? result = context
        .dependOnInheritedWidgetOfExactType<ChoiceQuestionAnswerService>();
    assert(result != null,
    AppLocalizations.of(context)!.errNoChoiceQuestionAnswerServiceFoundText);
    return result!;
  }

  Future<void> onChangedChoice(
      {required ChoiceQuestion question,
        required Choice? choice,
        required ChoiceQuestionAnswer? choiceQuestionAnswer,
        required SurveyEntryPath questionPath,
        required SurveyEntryPath choicePath,
        required Submission submission,
        required BuildContext context}) async {
    final vm = GetIt.I.get<ViewModel>();
    final store = GetIt.I.get<Store>();

    final selectedChoicesInPath =
    submission.getAnswers(vm: vm, path: questionPath);

    final ownSelectedChoices =
    selectedChoicesInPath.where((cqa) => cqa.isOwnedBySubmission(submission));

    if (choiceQuestionAnswer != null &&
        choiceQuestionAnswer.submissionId == submission.id) {
      final choiceToRemove = choiceQuestionAnswer;

      final inheritingAnswers = choiceToRemove
          .getAnswersOfInheritingSubmissionsRecursivly(
          submission: submission,
          vm: vm,
          path: choicePath)
          .where((cqa) => cqa.isInheritingFromSubmission(submission));
      final inheritingSubmissionTitles =
      inheritingAnswers.map((a) => a.getSubmission(vm).title).toSet();
      final answerToReplaceOrDelete = question.choices
          .firstWhereOrNull((choice) => choice.value == choiceToRemove.answer);

      final isInherited =
          choiceToRemove.linkedSubmissionId != choiceToRemove.submissionId;
      if (isInherited) {
        store.removeChoiceQuestionAnswers(
            choiceQuestionAnswers: {choiceToRemove});

        return;
      }

      final hasConcretisations = vm.concretisationsViewModel.byId.values.any(
              (concretisation) =>
          concretisation.choiceQuestionAnswerId == choiceToRemove.id);

      final hasInheritingChildren = vm.concretisationsViewModel.byId.values.any(
              (concretisation) =>
          concretisation.choiceQuestionAnswerId == choiceToRemove.id);

      final bool remove;

      if (hasConcretisations) {
        final answer = question.choices.firstWhereOrNull(
                (choice) => choice.value == choiceToRemove.answer);

        final dialogAnswer = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return ConfirmDialog(
                  title:
                  AppLocalizations.of(context)!.deleteAnswerTitle(answer?.title ?? choiceToRemove.answer),
                  contentText:
                  AppLocalizations.of(context)!.deleteAnswerContentText(answer?.title ?? choiceToRemove.answer),
                  acceptTitle: AppLocalizations.of(context)!.acceptDeleteTitle,
                  cancelTitle: AppLocalizations.of(context)!.cancelDeleteTitle);
            });

        remove = dialogAnswer == true;
      } else {
        remove = true;
      }

      final Enum? deleteInheritedAnswerOperation;
      if (inheritingAnswers.isNotEmpty) {
        deleteInheritedAnswerOperation =
        await showDialog<DeleteInheritedAnswerOperation>(
            context: context,
            builder: (BuildContext context) =>
                DeleteInheritedAnswerOperationDialog(
                    answerToDelete: answerToReplaceOrDelete!,
                    inheritingSubmissionTitles: inheritingSubmissionTitles));
      } else {
        deleteInheritedAnswerOperation =
            ChangeInheritedAnswerOperation.notNecessary;
      }

      if (deleteInheritedAnswerOperation ==
          DeleteInheritedAnswerOperation.cancel) {
        return;
      }

      if (remove) {
        store.removeChoiceQuestionAnswers(choiceQuestionAnswers: {
          choiceToRemove,
          if (deleteInheritedAnswerOperation ==
              DeleteInheritedAnswerOperation.delete)
            ...inheritingAnswers
        });
      }

      return;
    }

    if (choiceQuestionAnswer != null &&
        choiceQuestionAnswer.submissionId != submission.id) {
      final addChoiceAnswerResponse = await store.addChoiceAnswer(
          submission: submission,
          linkedSubmissionId: choiceQuestionAnswer.submissionId,
          path: questionPath,
          newQuestion: question.id,
          answer: choiceQuestionAnswer.answer);
      return;
    }

    if (ownSelectedChoices.isEmpty) {
      final addChoiceAnswerResponse = await store.addChoiceAnswer(
          submission: submission,
          linkedSubmissionId: submission.id,
          path: questionPath,
          newQuestion: question.id,
          answer: choice!.value);
      return;
    }

    if (question is SingleChoiceQuestion) {
      final choiceToReplace = ownSelectedChoices.single;

      final pathOfChoiceToUnselect =
      questionPath.getChoicePath(choiceToReplace.answer);

      final inheritingAnswers = choiceToReplace
          .getAnswersOfInheritingSubmissionsRecursivly(
          submission: submission,
          vm: vm,
          path: pathOfChoiceToUnselect)
          .where((cqa) => cqa.isInheritingFromSubmission(submission));
      final subquestionAnswers =
      choiceToReplace.getSubquestionAnswers(vm);

      final inheritingSubmissionTitles =
      inheritingAnswers.map((a) => a.getSubmission(vm).title).toSet();
      final answerToReplaceOrDelete = question.choices
          .firstWhereOrNull((choice) => choice.value == choiceToReplace.answer);

      final hasConcretisations = vm.concretisationsViewModel.byId.values.any(
              (concretisation) =>
          concretisation.choiceQuestionAnswerId == choiceToReplace.id);

      final answerToReplaceWith = choice;

      final bool? replace;

      if (hasConcretisations || subquestionAnswers.isNotEmpty) {

        String createContainsMessage(BuildContext context) {
          if (hasConcretisations && subquestionAnswers.isNotEmpty) {
            return AppLocalizations.of(context)!.concretisationsAndAnsweredSubQuestionsText;
          }
          if (hasConcretisations) {
            return AppLocalizations.of(context)!.concretisationText;
          }
          if (subquestionAnswers.isNotEmpty) {
            return  AppLocalizations.of(context)!.answeredSubQuestionsText;
          }
          throw AssertionError();
        }

        String createActionMessage(BuildContext context) {
          if (hasConcretisations && subquestionAnswers.isNotEmpty) {
            return AppLocalizations.of(context)!.concretisationsMovedAndSubQuestionsDeletedText(answerToReplaceWith?.title);
          }
          if (hasConcretisations) {
            return AppLocalizations.of(context)!.concretisationsMovedText(answerToReplaceWith?.title);
          }
          if (subquestionAnswers.isNotEmpty) {
            return AppLocalizations.of(context)!.deleteAnsweredSubQuestions;
          }
          throw AssertionError();
        }

        String createAcceptTitle(BuildContext context) {
          if (hasConcretisations && subquestionAnswers.isNotEmpty) {
            return AppLocalizations.of(context)!.concretisationsMovedAndSubQuestionsDeletedTitle;
          }
          if (hasConcretisations) {
            return AppLocalizations.of(context)!.concretisationsMovedTitle;
          }
          if (subquestionAnswers.isNotEmpty) {
            return AppLocalizations.of(context)!.deleteSubAnswersTitle;
          }
          throw AssertionError();
        }

        replace = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return ConfirmDialog(
                  title:
                  AppLocalizations.of(context)!.replaceAnswersQuestion(answerToReplaceOrDelete?.title ?? choiceToReplace.answer,answerToReplaceWith?.title),
                  contentText:
                  AppLocalizations.of(context)!.replaceFollowUpMessagesText(answerToReplaceOrDelete?.title ?? choiceToReplace.answer,answerToReplaceWith?.title,createContainsMessage(context)),
                  acceptTitle: AppLocalizations.of(context)!.replaceAndCreateAcceptTitle(createAcceptTitle(context)),
                  cancelTitle: AppLocalizations.of(context)!.abortReplaceCancelTitle);
            });
      } else {
        replace = true;
      }

      if (replace == true) {
        final ChangeInheritedAnswerOperation? changeInheritedAnswerOperation;
        if (inheritingAnswers.isNotEmpty) {
          changeInheritedAnswerOperation =
          await showDialog<ChangeInheritedAnswerOperation>(
              context: context,
              builder: (BuildContext context) =>
                  InheritedAnswerOperationDialog(
                      answerToReplace: answerToReplaceOrDelete!,
                      answerToReplaceWith: answerToReplaceWith!,
                      inheritingSubmissionTitles: inheritingSubmissionTitles));
        } else {
          changeInheritedAnswerOperation =
              ChangeInheritedAnswerOperation.notNecessary;
        }

        if (changeInheritedAnswerOperation ==
            ChangeInheritedAnswerOperation.cancel ||
            changeInheritedAnswerOperation == null) {
          return;
        }

        final updatedInheritingAnswers = <ChoiceQuestionAnswer>{
          for (final answer in inheritingAnswers)
            answer.rebuild((b) => b.answer = choice!.value)
        };

        final inheritingAnswersToUpdate = <ChoiceQuestionAnswer>{
          for (final updatedAnswer in updatedInheritingAnswers)
            if (selectedChoicesInPath.none((originalAnswer) =>
            updatedAnswer.submissionId == originalAnswer.submissionId &&
                updatedAnswer.question == originalAnswer.question &&
                updatedAnswer.linkedSubmissionId == originalAnswer.linkedSubmissionId &&
                updatedAnswer.answer == originalAnswer.answer &&
                updatedAnswer.parentId == originalAnswer.parentId))
              updatedAnswer
        };

        final inheritingAnswersToDelete = <ChoiceQuestionAnswer>{
          for (final updatedAnswer in updatedInheritingAnswers)
            if (selectedChoicesInPath.any((originalAnswer) =>
            updatedAnswer.submissionId == originalAnswer.submissionId &&
                updatedAnswer.question == originalAnswer.question &&
                updatedAnswer.linkedSubmissionId == originalAnswer.linkedSubmissionId &&
                updatedAnswer.answer == originalAnswer.answer &&
                updatedAnswer.parentId == originalAnswer.parentId))
              updatedAnswer
        };

        await store.removeChoiceQuestionAnswers(choiceQuestionAnswers: {
          if (changeInheritedAnswerOperation ==
              ChangeInheritedAnswerOperation.delete)
            ...inheritingAnswers,
          ...subquestionAnswers
        });

        await store.updateChoiceAnswers(
            updates: BuiltSet(<ChoiceQuestionAnswer>[
              choiceToReplace.rebuild((b) => b.answer = choice!.value),
              if (changeInheritedAnswerOperation ==
                  ChangeInheritedAnswerOperation.move)
                for (final answer in inheritingAnswersToUpdate) answer
            ]));

        if (changeInheritedAnswerOperation ==
            ChangeInheritedAnswerOperation.move &&
            inheritingAnswersToDelete.isNotEmpty) {
          await store.removeChoiceQuestionAnswers(
              choiceQuestionAnswers: inheritingAnswersToDelete);
        }
      }

      return;
    }
    if (question is MultipleChoiceQuestion) {
      final addChoiceAnswerResponse = await store.addChoiceAnswer(
          submission: submission,
          linkedSubmissionId: submission.id,
          path: questionPath,
          newQuestion: question.id,
          answer: choice!.value);

      return;
    }
    return;
  }
}