import 'dart:async';
import 'package:json_to_survey/src/submissions_detail_table/submission_table_page.dart';
import 'package:json_to_survey/submissions_detail_table.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/add_survey/add_submission.dart';
import 'package:json_to_survey/src/dialogs/exception_dialog.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_submission.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_survey.dart';
import 'package:json_to_survey/src/login/login.dart';
import 'package:json_to_survey/src/value_types/submission_extensions.dart';
import 'package:json_to_survey/src/view_model/view_models.dart';
import 'package:json_to_survey/src/submission_detail/submission_detail_view.dart';
import 'package:json_to_survey/src/submission_overview/submission_overview_view.dart';
import 'package:json_to_survey/src/survey_overview/survey_overview_view.dart';
import 'package:json_to_survey/src/widgets/app_state.dart';
import 'package:rxdart/rxdart.dart';

import 'inherited_widgets/submission_filters.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';
import 'survey_structure_sandbox/survey_structure_sandbox_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
    required this.storeService,
    required this.sidebarNavigatorService,
    required this.mainNavigatorService,
  });

  final SettingsController settingsController;
  final StoreService storeService;
  final SidebarNavigatorService sidebarNavigatorService;
  final MainNavigatorService mainNavigatorService;

  @override
  Widget build(BuildContext context) {
    try {
      return AppState(
        storeService: storeService,
        sidebarNavigatorService: sidebarNavigatorService,
        mainNavigatorService: mainNavigatorService,
        child: StreamBuilder(
            stream: Rx.combineLatest([
              storeService.storeBehavior.distinct(),
              storeService.selectedSurveyTypeBehavior.distinct(),
              storeService.selectedSubmissionBehavior.distinct(),
              mainNavigatorService.currentViewBehaviour
            ], (values) => null),
            builder: (context, snapshot) {
              final currentView = mainNavigatorService.currentView;
              final vm = GetIt.I.get<ViewModel>();
              final store = storeService.storeBehavior.value;
              final selectedSurveyType = storeService.selectedSurveyTypeBehavior.value;
              final selectedSubmission = storeService.selectedSubmissionBehavior.value;

              final storeIsSet = store != null;
              final surveyTypeIsSet = storeIsSet && selectedSurveyType != null;
              final submissionIsSet = surveyTypeIsSet && selectedSubmission != null;

              Widget app = AnimatedBuilder(
                animation: settingsController,
                builder: (BuildContext context, Widget? child) {
                  return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      // Providing a restorationScopeId allows the Navigator built by the
                      // MaterialApp to restore the navigation stack when a user leaves and
                      // returns to the app after it has been killed while running in the
                      // background.
                      restorationScopeId: 'app',

                      // Provide the generated AppLocalizations to the MaterialApp. This
                      // allows descendant Widgets to display the correct translations
                      // depending on the user's locale.
                      localizationsDelegates: const [
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: const [
                        Locale('en', ''), // English, no country code
                        Locale('de', '')
                      ],

                      // Use AppLocalizations to configure the correct application title
                      // depending on the user's locale.
                      //
                      // The appTitle is defined in .arb files found in the localization
                      // directory.
                      onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,

                      // Define a light and dark color theme. Then, read the user's
                      // preferred ThemeMode (light, dark, or system default) from the
                      // SettingsController to display the correct theme.
                      theme: ThemeData(),
                      darkTheme: ThemeData.dark(),
                      themeMode: settingsController.themeMode,
                      home: Navigator(
                        pages: [
                          if (store == null) const LoginPage(),
                          if (storeIsSet) const SurveyOverviewPage(),
                          if (surveyTypeIsSet)
                            SubmissionOverviewPage(
                              onSelectSubmission: (submission) async {
                                final dialogContext = context;

                                runZonedGuarded(() async {
                                  final submissionLinks = await store.fetchSubmissionLinksForSubmission(submission: submission);

                                  final concretisationsFuture = await store.fetchChoiceAnswers(submissions: {
                                    submission,
                                    ...submission.getParents(vm),
                                    ...submission.getChildren(vm),
                                  }).then(
                                      (answers) => store.fetchConcretisations(choiceQuestionAnswerIds: answers.map((answer) => answer.id).toList()));

                                  storeService.selectedSubmissionBehavior.value = submission;

                                  sidebarNavigatorService.clear();
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
                          if (currentView == Views.submissionTableView) SubmissionTablePage(),
                          if (submissionIsSet) const SubmissionInputDetailPage(),
                          if (surveyTypeIsSet && currentView == Views.addNewSubmissionView) const AddSubmissionPage(),
                          if (currentView == Views.settingsView) SettingsPage(controller: settingsController),
                          if (storeIsSet && currentView == Views.sandboxView) const SurveyStructureSandboxPage(),
                        ],
                        onPopPage: (route, result) {
                          if (!route.didPop(result)) {
                            return false;
                          }

                          if (route.settings is SurveyOverviewPage) {
                            storeService.store = null;
                            return true;
                          }

                          if (route.settings is SubmissionOverviewPage) {
                            storeService.selectedSurveyType = null;
                            return true;
                          }

                          if (route.settings is SubmissionInputDetailPage) {
                            storeService.selectedSubmission = null;
                            return true;
                          }

                          if (route.settings is AddSubmissionPage || route.settings is SettingsPage || route.settings is SurveyStructureSandboxPage) {
                            mainNavigatorService.currentView = null;
                            return true;
                          }

                          if (route.settings is SubmissionTablePage) {
                            mainNavigatorService.currentView = null;
                            return true;
                          }

                          return true;
                        },
                      ));
                },
              );

              app = SubmissionFilters(child: app);

              if (selectedSurveyType == null) {
                return app;
              }
              app = SelectedSurvey(selectedSurvey: selectedSurveyType, child: app);

              if (selectedSubmission == null) {
                return app;
              }

              app = SelectedSubmission(selectedSubmission: selectedSubmission, child: app);

              return app;
            }),
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return ExceptionDialog(
              exception: e.toString(),
            );
          });
      rethrow;
    }
  }
}
