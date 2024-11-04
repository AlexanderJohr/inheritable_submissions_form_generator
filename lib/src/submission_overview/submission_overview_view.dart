import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/dialogs/confirm_dialog.dart';
import 'package:json_to_survey/src/dialogs/exception_dialog.dart';
import 'package:json_to_survey/src/dialogs/rename_survey_dialog.dart';
import 'package:json_to_survey/src/dialogs/survey_duplicate_title_dialog.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_submission.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_survey.dart';
import 'package:json_to_survey/src/settings_view_button.dart';
import 'package:json_to_survey/src/value_types/submission_extensions.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:json_to_survey/src/widgets/survey_error.dart';
import 'package:rxdart/rxdart.dart';

import '../inherited_widgets/submission_filters.dart';
import '../store/store.dart';
import '../view_model/view_models.dart';
import '../widgets/app_state.dart';
import '../widgets/choice_question_card.dart';

const filterableQuestionIds = ['last_status', 'id_bdl', 'id_foerd_per', 'komplex_typ'];

class SubmissionOverviewPage extends Page {
  const SubmissionOverviewPage({super.key, required this.onSelectSubmission});

  final OnSelectSubmission onSelectSubmission;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        return SubmissionOverviewView(onSelectSubmission: onSelectSubmission);
      },
    );
  }
}

typedef OnSelectSubmission = void Function(Submission selectedSubmission);

class SubmissionOverviewView extends StatelessWidget {
  const SubmissionOverviewView({super.key, required this.onSelectSubmission});

  final OnSelectSubmission onSelectSubmission;

  static const routeName = '/submission-input-overview';

  @override
  Widget build(BuildContext context) {
    final vm = GetIt.I.get<ViewModel>();
    final appState = AppState.of(context);
    final submissionFilters = SubmissionFilters.of(context);

    final filterSubmissionByAttributes = submissionFilters.filterSubmissionsByAttributes;
    final filterSubmissionsByUsers = submissionFilters.filterSubmissionsByUsers;

    final store = GetIt.I.get<Store>();

    final selectedSurveyType = SelectedSurvey.of(context);

    final questions = selectedSurveyType.structure.questions;
    final filterableQuestions = [
      for (final questionId in filterableQuestionIds) questions.whereType<ChoiceQuestion>().singleWhere((q) => q.id == questionId)
    ];

    submissionFilters.filterSubmissionsByAttributes = {
      for (final question in filterableQuestions) question: filterSubmissionByAttributes[question] ?? {}
    };

    return StreamBuilder(
        stream: Rx.combineLatest([], (_) => _),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.selectSubmissionTitle),
              actions: const [
                SearchSubmissionTextField(),
                TableViewButton(),
                SortSubmissionByDateOrNameToggleActionButton(),
                ClearValidationResultActionButton(),
                ValidateSubmissionsActionButton(),
                FilterSubmissionsActionButton(),
                ReloadSubmissionsActionButton(),
                SettingsViewButton()
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                slivers: [
                  StreamBuilder(
                      // TODO: Do I need this many streams?
                      stream: Rx.merge([vm.submissionViewModel.changed, vm.concretisationsViewModel.changed, submissionFilters.changed]),
                      builder: (context, snapshot) {
                        final submissionsUnsorted = vm.submissionViewModel.getFilteredSubmissions(
                            filterByUsers: filterSubmissionsByUsers,
                            filterByAttributes: filterSubmissionByAttributes,
                            filterByName: submissionFilters.filterName);

                        final submissionsSorted = submissionFilters.sortAlpha
                            ? submissionsUnsorted.sortedBy((s) => s.title)
                            : submissionsUnsorted.sortedBy((s) => s.createdDate).reversed.toList();

                        return SliverList(
                            delegate: SliverChildBuilderDelegate((context, i) {
                          final submission = submissionsSorted[i];
                          final cqas = store.choiceQuestionAnswersById.value.values.where((cqa) => submission.id == cqa.submissionId).toSet();

                          final date = submission.createdDate.toLocal();

                          return SelectedSubmission(
                            selectedSubmission: submission,
                            child: ListTile(
                              title: Text(submission.title),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      for (final question in filterSubmissionByAttributes.keys)
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 16, right: 2),
                                              child: Text("${question.title}:"),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: Text(question.choices
                                                  .where((c) => cqas.any((a) => a.question == question.id && c.value == a.answer))
                                                  .map((p0) => p0.title)
                                                  .join(", ")),
                                            ),
                                          ],
                                        ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16, right: 2),
                                            child: Text(AppLocalizations.of(context)!.createdByLabel),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 2, right: 16),
                                            child: Text(submission.createdBy),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16, right: 2),
                                            child: Text(AppLocalizations.of(context)!.createdLabel),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 2, right: 16),
                                            child: Text("${date.day}.${date.month}.${date.year} ${date.hour}:${date.minute}:${date.second}"),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SubmissionError(submission: submission)
                                ],
                              ),
                              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return RenameSubmissionDialog(
                                            submission: submission,
                                          );
                                        });
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.copy),
                                  onPressed: () {
                                    final dialogContext = context;

                                    showDialog<String>(
                                        context: dialogContext,
                                        builder: (BuildContext context) {
                                          return SubmissionDuplicateTitleDialog(
                                            submission: submission,
                                          );
                                        });
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async {
                                    final deleteConfirmed = await showDialog<bool>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ConfirmDialog(
                                            title: AppLocalizations.of(context)!.deleteSubmissionQuestionText(submission.title),
                                            acceptTitle: AppLocalizations.of(context)!.deleteButtonText,
                                          );
                                        });
                                    if (deleteConfirmed == true) {
                                      final dialogContext = context;

                                      runZonedGuarded(() async {
                                        store.deleteSubmission(submission: submission);
                                      }, (error, stackTrace) {
                                        showDialog(
                                            context: dialogContext,
                                            builder: (BuildContext context) {
                                              return ExceptionDialog(
                                                exception: AppLocalizations.of(context)!.errText(error, stackTrace),
                                              );
                                            });
                                      });
                                    }
                                  },
                                )
                              ]),
                              onTap: () async {
                                onSelectSubmission(submission);
                              },
                            ),
                          );
                        }, childCount: submissionsSorted.length));
                      })
                ],
                cacheExtent: 4000,
              ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  appState.mainNavigatorService.currentView = Views.addNewSubmissionView;
                },
                tooltip: setConfirmToolTip(context),
                child: const Icon(Icons.add)),
          );
        });
  }
}

class SearchSubmissionTextField extends StatelessWidget {
  const SearchSubmissionTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    final submissionFilters = SubmissionFilters.of(context);

    final filterTextEditingController = TextEditingController(text: submissionFilters.filterName);

    return SizedBox(
      width: 200,
      child: TextField(
        controller: filterTextEditingController,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.searchPlaceholderText,
          labelText: AppLocalizations.of(context)!.searchSubmissionLabel,
          hintStyle: const TextStyle(color: Colors.white54),
          labelStyle: const TextStyle(color: Colors.white),
          border: const UnderlineInputBorder(),
        ),
        onChanged: (value) {
          submissionFilters.filterName = value;
        },
      ),
    );
  }
}

class TableDetailViewButton extends StatelessWidget {
  const TableDetailViewButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    return IconButton(
      icon: const Icon(Icons.table_chart_sharp),
      onPressed: () async {
        // TODO: implement
        //appState.mainNavigatorService.currentView = Views.tableDetailView;
      },
    );
  }
}

class SortSubmissionByDateOrNameToggleActionButton extends StatelessWidget {
  const SortSubmissionByDateOrNameToggleActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    final submissionFilters = SubmissionFilters.of(context);

    return IconButton(
      icon: const Icon(Icons.sort_by_alpha),
      onPressed: () async {
        submissionFilters.sortAlpha = !submissionFilters.sortAlpha;
      },
    );
  }
}

class ClearValidationResultActionButton extends StatelessWidget {
  const ClearValidationResultActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I.get<Store>();

    return IconButton(
      icon: const Icon(Icons.playlist_remove),
      onPressed: () async {
        store.clearValidationResult();
      },
    );
  }
}

class TableViewButton extends StatelessWidget {
  const TableViewButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = GetIt.I.get<ViewModel>();
    final store = GetIt.I.get<Store>();

    final selectedSurveyType = SelectedSurvey.of(context);

    return IconButton(
      icon: const Icon(Icons.table_chart_outlined),
      onPressed: () async {
        final dialogContext = context;
        runZonedGuarded(() async {
          final submissions = await store.fetchSubmissions(surveyId: selectedSurveyType.id);
          await store.fetchSubmissionLinksForSubmissions(submissions: submissions);
          final choiceAnswers = await store.fetchChoiceAnswers(submissions: submissions);
          final concretisations = await store.fetchConcretisations(choiceQuestionAnswerIds: choiceAnswers.map((choiceAnswer) => choiceAnswer.id));

          AppState.of(context).mainNavigatorService.currentView = Views.submissionTableView;
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
    );
  }
}

class ReloadSubmissionsActionButton extends StatelessWidget {
  const ReloadSubmissionsActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = GetIt.I.get<ViewModel>();
    final store = GetIt.I.get<Store>();

    final selectedSurveyType = SelectedSurvey.of(context);

    return IconButton(
      icon: const Icon(Icons.replay_outlined),
      onPressed: () async {
        final dialogContext = context;

        runZonedGuarded(() async {
          final submissions = await store.fetchSubmissions(surveyId: selectedSurveyType.id);

          final generalData = await store.fetchGeneralSubmissionData(
              submissionIds: submissions.map((s) => s.id).toList(), questions: filterableQuestionIds, surveyTypeId: selectedSurveyType.id);

          final type = SelectedSurvey.of(context);

          final choiceAnswers = await store.fetchChoiceAnswers(submissions: submissions.toSet());

          final ansersTable = [];

          for (var iS = 0; iS < submissions.length; iS++) {
            final submission = submissions[iS];

            final answersForSubmission = vm.choiceQuestionAnswerViewModel.bySubmissionAndPath[submission];

            if (answersForSubmission == null) {
              continue;
            }

            final answerRow = [];

            for (var iQ = 0; iQ < type.structure.questions.length; iQ++) {
              final question = type.structure.questions[iQ];

              if (question is ChoiceQuestion) {
                final questionId = question.id;
                final answerForQuestion = answersForSubmission[SurveyEntryPath((b) => b.leafQuestion = questionId)];

                answerRow.add(answerForQuestion?.values.map((answer) => answer.answer).join(", "));
              }
            }

            ansersTable.add(answerRow);
          }

          print(ansersTable.length);
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
    );
  }
}

class FilterSubmissionsActionButton extends StatelessWidget {
  const FilterSubmissionsActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = GetIt.I.get<ViewModel>();
    final store = GetIt.I.get<Store>();

    final appState = AppState.of(context);
    final submissionFilters = SubmissionFilters.of(context);

    final filterSubmissionsByAttributes = submissionFilters.filterSubmissionsByAttributes;
    final filterSubmissionsByUsers = submissionFilters.filterSubmissionsByUsers;

    return PopupMenuButton(
      child: Row(children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.filter_alt),
        ),
        Text(filterSubmissionsByUsers.join(", "))
      ]),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              child: PopupMenuButton(
            child: StreamBuilder(
                stream: submissionFilters.changed,
                builder: (context, snapshot) {
                  return Row(children: [
                    const Icon(Icons.filter_alt),
                    Text("${AppLocalizations.of(context)!.creatorText}${filterSubmissionsByUsers.join(", ")}")
                  ]);
                }),
            itemBuilder: (context) {
              return [
                for (final user in {...filterSubmissionsByUsers, ...vm.submissionViewModel.byId.values.map((s) => s.createdBy).toSet().sorted()})
                  PopupMenuItem(
                      child: StreamBuilder(
                          stream: submissionFilters.filterByUserChanged,
                          builder: (context, snapshot) {
                            return CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(user),
                              value: filterSubmissionsByUsers.contains(user),
                              onChanged: (checked) {
                                if (checked == true) {
                                  submissionFilters.addUserToFilter(user);
                                } else if (checked == false) {
                                  submissionFilters.removeUserFromFilter(user);
                                }
                              },
                            );
                          }))
              ];
            },
          )),
          for (final attribute in {...filterSubmissionsByAttributes.keys.toSet()})
            PopupMenuItem(
                child: PopupMenuButton(
              child: StreamBuilder(
                  stream: submissionFilters.changed,
                  builder: (context, snapshot) {
                    return Row(children: [
                      const Icon(Icons.filter_alt),
                      Text(
                          "${attribute.title}: ${filterSubmissionsByAttributes[attribute]!.map((v) => attribute.getChoiceByValue(v)?.title ?? v).join(", ")}")
                    ]);
                  }),
              itemBuilder: (context) {
                final checkedFilters = filterSubmissionsByAttributes[attribute]?.toSet() ?? {};

                final answers = {
                  ...checkedFilters,
                  ...store.choiceQuestionAnswersById.value.values
                      .where((cqa) => cqa.question == attribute.id)
                      .map((cqa) => cqa.answer)
                      .toSet()
                      .sorted()
                };

                return [
                  for (final answer in [...answers, null])
                    PopupMenuItem(
                        child: StreamBuilder(
                            stream: submissionFilters.changed,
                            builder: (context, snapshot) {
                              return CheckboxListTile(
                                controlAffinity: ListTileControlAffinity.leading,
                                title: Text(attribute.getChoiceByValue(answer)?.title ?? AppLocalizations.of(context)!.noSelectionText),
                                value: filterSubmissionsByAttributes[attribute]!.contains(answer),
                                onChanged: (checked) {
                                  if (checked == true) {
                                    submissionFilters.addAttributeToFilter(attribute, answer);
                                  } else if (checked == false) {
                                    submissionFilters.removeAttributeFromFilter(attribute, answer);
                                  }
                                },
                              );
                            }))
                ];
              },
            ))
        ];
      },
    );
  }
}

class ValidateSubmissionsActionButton extends StatelessWidget {
  const ValidateSubmissionsActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = GetIt.I.get<ViewModel>();
    final store = GetIt.I.get<Store>();

    final appState = AppState.of(context);
    final submissionFilters = SubmissionFilters.of(context);

    final filterSubmissionsByAttributes = submissionFilters.filterSubmissionsByAttributes;
    final filterSubmissionsByUsers = submissionFilters.filterSubmissionsByUsers;

    return IconButton(
      icon: const Icon(Icons.playlist_add_check_sharp),
      onPressed: () async {
        final dialogContext = context;

        runZonedGuarded(() async {
          final filteredSubmissions = vm.submissionViewModel.getFilteredSubmissions(
              filterByUsers: filterSubmissionsByUsers, filterByAttributes: filterSubmissionsByAttributes, filterByName: submissionFilters.filterName);

          final submissionLinks = await store.fetchSubmissionLinks();

          final concretisationsFuture = await store.fetchChoiceAnswers(submissions: {
            ...filteredSubmissions,
            ...filteredSubmissions.expand((submission) => submission.getParents(vm)),
            ...filteredSubmissions.expand((submission) => submission.getChildren(vm)),
          }).then((answers) => store.fetchConcretisations(choiceQuestionAnswerIds: answers.map((answer) => answer.id).toList()));

          final errorsForAllSubmissions = {for (final submission in filteredSubmissions) submission: submission.validate(vm)};

          store.errorBySubmissionAndPath = store.errorBySubmissionAndPath.rebuild((b) {
            for (final submission in errorsForAllSubmissions.keys) {
              final errorsForSubmission = errorsForAllSubmissions[submission];

              if (errorsForSubmission == null) {
                continue;
              }
              b.addAll({submission: errorsForSubmission});
            }
          });
        }, (error, stackTrace) {
          showDialog(
              context: dialogContext,
              builder: (BuildContext context) {
                return ExceptionDialog(exception: AppLocalizations.of(context)!.errText(error, stackTrace));
              });
        });
      },
    );
  }
}
