import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/inherited_widgets/inherited_path.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_submission.dart';
import 'package:json_to_survey/src/view_model/view_models.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:json_to_survey/src/widgets/questions_list_view.dart';
import 'package:rxdart/rxdart.dart';

import 'app_state.dart';
import 'choice_question_error.dart';
import 'choice_question_page.dart';
import 'choice_question_page_history.dart';

class ChoiceQuestionCard extends StatelessWidget {
  ChoiceQuestionCard({super.key, required this.question, required this.enabled});

  final ChoiceQuestion question;
  final ViewModel vm = GetIt.I.get<ViewModel>();
  final bool enabled;

  final BehaviorSubject<BuiltSet<ChoiceQuestionAnswer>> viewModel = BehaviorSubject.seeded(BuiltSet());

  @override
  Widget build(BuildContext context) {
    final path = SurveyPath.of(context);

    final submission = SelectedSubmission.of(context);

    final focusNode = FocusNode();
    final keyboardFocusNode = FocusNode();

    navigateToSelectionScreen() async {
      focusNode.requestFocus();

      final newPage = ChoiceQuestionPage(
          path: path,
          question: question,
          onUpdateChoiceQuestionAnswer: (
                  {required choice,
                  required choicePath,
                  required choiceQuestionAnswer,
                  required question,
                  required questionPath,
                  required submission}) =>
              print("TODO: implement onUpdateChoiceQuestionAnswer"),
          vm: vm);

      final replaceHistory = ChoiceQuestionPageHistory.of(context).alwaysReplaceHistory;
      if (replaceHistory) {
        final sideBarNavigator = AppState.of(context).sidebarNavigatorService.sideBarNavigator.currentState;

        if (sideBarNavigator != null) {
          var multipleChoiceSelectionPageHistory = AppState.of(context).sidebarNavigatorService.multipleChoiceSelectionPageHistory.value;

          bool willPop;
          int lengthBeforeMaybePop;
          int lengthAfterMaybePop;
          do {
            lengthBeforeMaybePop = AppState.of(context).sidebarNavigatorService.multipleChoiceSelectionPageHistory.value.length;

            willPop = await sideBarNavigator.maybePop();

            lengthAfterMaybePop = AppState.of(context).sidebarNavigatorService.multipleChoiceSelectionPageHistory.value.length;
          } while (lengthBeforeMaybePop != lengthAfterMaybePop);

          var historyIsEmpty = AppState.of(context).sidebarNavigatorService.multipleChoiceSelectionPageHistory.value.length <= 1;
          if (historyIsEmpty) {
            AppState.of(context).sidebarNavigatorService.pushPage(newPage);
          }
        }
      } else {
        AppState.of(context).sidebarNavigatorService.pushPage(newPage);
      }
    }

    return StreamBuilder<BuiltSet<ChoiceQuestionAnswer>>(
        stream: viewModel,
        builder: (context, snapshot) {
          final answers = submission.getAnswers(vm: vm, path: path);

          final ownAnswers = answers.where((a) => a.isOwnedBySubmission(submission));
          final inheritedAnswers = answers.where((a) => !a.isOwnedBySubmission(submission));

          final joinedOwnAnswers = ownAnswers.map((answer) => answer.getChoiceTitle(question: question)).join(", ");

          final joinedInheritedAnswers = inheritedAnswers.map((answer) => answer.getChoiceTitle(question: question)).join(", ");

          final condition = question.enabledIf;

          final conditionIsSet = condition != null;

          final description = question.description;

          return Card(
            color: !enabled ? Colors.white70 : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: !enabled ? const Icon(Icons.ac_unit_rounded) : null,
                  title: Text(question.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (description != null) Text(description, style: const TextStyle(fontWeight: FontWeight.w400)),
                      if (joinedOwnAnswers.isNotEmpty) Text(joinedOwnAnswers, style: const TextStyle(fontWeight: FontWeight.bold)),
                      if (joinedInheritedAnswers.isNotEmpty)
                        Text("${AppLocalizations.of(context)!.inheritedText} $joinedInheritedAnswers",
                            style: const TextStyle(fontStyle: FontStyle.italic)),
                      const ChoiceQuestionError()
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (conditionIsSet)
                        IconButton(
                          icon: const Icon(Icons.info),
                          onPressed: () => ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(duration: const Duration(minutes: 10), content: ConditionChart(condition: condition))),
                        ),
                      const Icon(Icons.edit),
                    ],
                  ),
                  onTap: navigateToSelectionScreen,
                ),
              ],
            ),
          );
        });
  }
}

String setConfirmToolTip(BuildContext context) {
  final confirmButtonTooltip = AppLocalizations.of(context)!.confirmButtonToolTipText;
  return confirmButtonTooltip;
}
