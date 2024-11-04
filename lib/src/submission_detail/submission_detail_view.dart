import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_collection/src/set.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/inherited_widgets.dart';
import 'package:json_to_survey/src/dialogs/exception_dialog.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_submission.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_survey.dart';
import 'package:json_to_survey/src/settings_view_button.dart';
import 'package:json_to_survey/src/store/store.dart';
import 'package:json_to_survey/src/value_types/submission_extensions.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:json_to_survey/src/widgets/choice_question_page.dart';

import '../view_model/view_models.dart';
import '../widgets/app_state.dart';
import '../widgets/choice_question_page_history.dart';
import '../widgets/questions_list_view.dart';


class SubmissionInputDetailPage extends Page {
  const SubmissionInputDetailPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        return SubmissionDetailView();
      },
    );
  }
}

class SubmissionDetailView extends StatelessWidget {
  SubmissionDetailView({super.key});

  static const routeName = '/submission-input-detail';

  String? errorText;

  @override
  Widget build(BuildContext context) {
    final vm = GetIt.I.get<ViewModel>();
    final selectedSurveyType = SelectedSurvey.of(context);

    final store = GetIt.I.get<Store>();


    final selectedSubmission = SelectedSubmission.of(context);

    final questions = selectedSurveyType.structure.questions.toList();

    return ChoiceQuestionAnswerService(
      submission: selectedSubmission,
      child: Scaffold(
          appBar: AppBar(
            title: Text(selectedSubmission.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.playlist_remove),
                onPressed: () async {
                  store.clearValidationResult();
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_tree_rounded),
                onPressed: () {
                  final typeAsMarkdown =
                      selectedSubmission.getSurvey(vm).toMarkdown();
                  Clipboard.setData(ClipboardData(text: typeAsMarkdown));
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Markdown(data: typeAsMarkdown),
                        );
                      });
                },
              ),
              IconButton(
                icon: const Icon(Icons.playlist_add_check_sharp),
                onPressed: () {
                  final dialogContext = context;

                  runZonedGuarded(() async {
                    final errorsForThisSubmission = selectedSubmission.validate(vm);

                    store.errorBySubmissionAndPath = store.errorBySubmissionAndPath
                        .rebuild((b) =>
                            b.addAll({selectedSubmission: errorsForThisSubmission}));
                  }, (error, stackTrace) {
                    showDialog(
                        context: dialogContext,
                        builder: (BuildContext context) {
                          return ExceptionDialog(
                            exception: AppLocalizations.of(context)!.errText(error, stackTrace),
                          );
                        });
                  });
                },
              ),
              const SettingsViewButton(),
            ],
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: ChoiceQuestionPageHistory(
                            alwaysReplaceHistory: true,
                            child: QuestionsListView(
                              path: SurveyEntryPath(),
                              questions: questions,
                              errorText: errorText,
                              shrinkWrap: false,
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: StreamBuilder(
                              stream: AppState.of(context)
                                  .sidebarNavigatorService
                                  .multipleChoiceSelectionPageHistory,
                              builder: (context, snapshot) {
                                return Navigator(
                                  key: AppState.of(context)
                                      .sidebarNavigatorService
                                      .sideBarNavigator,
                                  pages: AppState.of(context)
                                      .sidebarNavigatorService
                                      .multipleChoiceSelectionPageHistory
                                      .value
                                      .toList(),
                                  onPopPage: (route, result) {
                                    if (!route.didPop(result)) {
                                      return false;
                                    }
                                    if (route.settings is ChoiceQuestionPage) {
                                      AppState.of(context)
                                          .sidebarNavigatorService
                                          .popPage();
                                    }
                                    return true;
                                  },
                                );
                              }))
                    ],
                  )
              )),
    );
  }
}
