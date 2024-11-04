import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/dialogs/exception_dialog.dart';
import 'package:json_to_survey/src/settings_view_button.dart';
import 'package:rxdart/rxdart.dart';

import '../store/store.dart';
import '../view_model/view_models.dart';
import '../submission_overview/submission_overview_view.dart';
import '../widgets/app_state.dart';

class SurveyOverviewPage extends Page {
  const SurveyOverviewPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        return const SurveyTypeOverviewView();
      },
    );
  }
}

class SurveyTypeOverviewView extends StatelessWidget {
  const SurveyTypeOverviewView({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final vm = GetIt.I.get<ViewModel>();
    final store = GetIt.I.get<Store>();


    final multipleChoiceSelectionPageHistory = AppState.of(context)
        .sidebarNavigatorService
        .multipleChoiceSelectionPageHistory
        .value;

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.selectSurveyTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.replay_outlined),
              onPressed: () {
                final dialogContext = context;

                runZonedGuarded(() async {
                  store.fetchSurveys();
                }, (error, stackTrace) {
                  showDialog(
                      context: dialogContext,
                      builder: (BuildContext context) {
                        return ExceptionDialog(
                          exception: AppLocalizations.of(context)!
                              .errText(error, stackTrace),
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
          child: StreamBuilder(
              stream: Rx.combineLatest(
                  [AppState.of(context).storeService.storeBehavior], (_) => _),
              builder: (context, snapshot) {
                final store = GetIt.I.get<Store>();

                AppState.of(context).storeService.storeBehavior.value;

                return StreamBuilder(
                    stream: vm.surveyViewModel.changed,
                    builder: (context, snapshot) {
                      final surveyTypes =
                          vm.surveyViewModel.byId.values.toList();

                      return CustomScrollView(
                        slivers: [
                          SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, i) {
                            final surveyType = surveyTypes[i];

                            return ListTile(
                              title: Text(surveyType.name),
                              subtitle: Text(surveyType.description),
                              onTap: () async {
                                final navigator = Navigator.of(context);

                                final dialogContext = context;

                                runZonedGuarded(() async {
                                  AppState.of(context)
                                      .storeService
                                      .selectedSurveyTypeBehavior
                                      .value = surveyType;

                                  vm.submissionViewModel.clear();
                                  vm.choiceQuestionAnswerViewModel.clear();
                                  vm.concretisationsViewModel.clear();

                                  final submissions =
                                      await store.fetchSubmissions(
                                          surveyId: surveyType.id);

                                  final generalData =
                                      await store.fetchGeneralSubmissionData(
                                          submissionIds: submissions
                                              .map((s) => s.id)
                                              .toList(),
                                          questions: filterableQuestionIds,
                                          surveyTypeId: surveyType.id);

                                }, (error, stackTrace) {
                                  showDialog(
                                      context: dialogContext,
                                      builder: (BuildContext context) {
                                        return ExceptionDialog(
                                          exception:
                                              AppLocalizations.of(context)!
                                                  .errText(error, stackTrace),
                                        );
                                      });
                                });
                              },
                            );
                          }, childCount: surveyTypes.length))
                        ],
                        cacheExtent: 4000,
                      );
                    });
              }),
        ));
  }
}
