import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/inherited_widgets.dart';
import 'package:json_to_survey/src/dialogs/confirm_dialog.dart';
import 'package:json_to_survey/src/dialogs/exception_dialog.dart';
import 'package:json_to_survey/src/dialogs/inherit_properties_from_survey_dialog.dart';
import 'package:json_to_survey/src/dialogs/select_linked_survey_dialog.dart';
import 'package:json_to_survey/src/inherited_widgets/inherited_path.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_submission.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_survey.dart';
import 'package:json_to_survey/src/store/store.dart';
import 'package:json_to_survey/src/view_model/view_models.dart';
import 'package:json_to_survey/src/submission_detail/submission_detail_view.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:rxdart/rxdart.dart';

import '../widgets/choice_question_card.dart';
import 'choice_question_error.dart';

class QuestionsListView extends StatelessWidget {
  QuestionsListView({
    super.key,
    required this.path,
    required this.questions,
    required this.errorText,
    required this.shrinkWrap
  });

  SurveyEntryPath path;
  final List<SurveyEntry> questions;

  final String? errorText;
  bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    final vm = GetIt.I.get<ViewModel>();

    final store = GetIt.I.get<Store>();

    final surveyType = SelectedSurvey.of(context);

    final submission = SelectedSubmission.of(context);

    final errorText = this.errorText;
    if (errorText != null) {
      return Text(errorText);
    }

    return CustomScrollView(
      shrinkWrap: shrinkWrap,
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate((context, i) {
          final question = questions[i]
              .resolveConcreteQuestion(surveyType); // resolvedQuestions[i];
          if (question is ChoiceQuestion) {
            return Builder(builder: (context) {
              final questionPath = path.appendQuestion(question);

              return SurveyPath(
                surveyEntryPath: questionPath,
                child: StreamBuilder(
                    stream: Rx.combineLatest2<Iterable<ChoiceQuestionAnswer>, bool, (Iterable<ChoiceQuestionAnswer>, bool)>(
                      vm.choiceQuestionAnswerViewModel.changed.map((_) {
                        final answers = submission.getAnswers(
                            vm: vm, path: questionPath);
                        return answers;
                      }).distinct(),
                      // TODO: allow enabledIf also for nested paths
                      vm.choiceQuestionAnswerViewModel.changed.map((_) => question.enabledIf?.check((field) {
                              final path = SurveyEntryPath(
                                  (b) => b.leafQuestion = field);
                              final valuesForField = submission.getAnswers(
                                  vm: vm, path: path);
                              return valuesForField
                                  .map((v) => v.answer)
                                  .toBuiltSet();
                            }) ??
                            true).distinct()
                    , (answers, enabled) => (answers, enabled)),
                    builder: (context, snapshot) {
                      final snapshotData = snapshot.data;
                      if (snapshotData == null) {
                        return SizedBox.shrink();
                      }
                      final (answers, enabled) = snapshotData;

                      return ChoiceQuestionCard(
                          enabled: enabled, question: question);
                    }),
              );
            });
          } else if (question is LinkOtherSurveyQuestion) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder(
                      stream: vm.submissionLinkViewModel.changed,
                      builder: (context, snapshot) {
                        final submissionLink = vm.submissionLinkViewModel.byId.values
                            .singleWhereOrNull((link) =>
                                link.childId == submission.id &&
                                link.relationship == question.id &&
                                link.choiceQuestionAnswerParent ==
                                    path.getParentId(submission: submission, vm: vm));

                        final parentId = submissionLink?.parentId;

                        final linkedSubmission = vm.submissionViewModel.byId[parentId];

                        return ListTile(
                          title: Text(question.title),
                          subtitle: Text(
                              linkedSubmission?.title ?? AppLocalizations.of(context)!.noSubmissionSelectedText),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {},
                              ),
                              if (linkedSubmission != null && submissionLink != null)
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () async {
                                      final dialogContext = context;

                                      runZonedGuarded(() async {
                                        await deleteSubmissionLink(context,
                                            linkedSubmission, store, submissionLink);
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
                                ),
                            ],
                          ),
                          onTap: () async {
                            try {
                              final selectedSubmissionToLink =
                                  await showDialog<Submission>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const SelectLinkedSubmissionDialog();
                                      });

                              if (selectedSubmissionToLink == null) {
                                return;
                              }

                              if (linkedSubmission != null && submissionLink != null) {
                                bool deleted = await deleteSubmissionLink(
                                    context, linkedSubmission, store, submissionLink);

                                if (!deleted) {
                                  return;
                                }
                              }

                              final possiblePropertiesToInherit = await store
                                  .fetchChoiceAnswers(
                                      submissions: {selectedSubmissionToLink});
                              final selectedSubmissionToLinkOwnProperties =
                                  possiblePropertiesToInherit
                                      .where((p) =>
                                          p.isOwnedOrInheritedBySubmission(
                                              selectedSubmissionToLink))
                                      .toBuiltList();

                              final result = await showDialog<
                                      BuiltList<ChoiceQuestionAnswer>?>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return InheritPropertiesFromSubmissionDialog(
                                        allPossiblePropertiesToInherit:
                                            selectedSubmissionToLinkOwnProperties);
                                  });

                              if (result == null) {
                                return;
                              }

                              await store.addSubmissionLink(
                                  vm:vm,
                                  submission: submission,
                                  path: path,
                                  question: question,
                                  linkedSubmission: selectedSubmissionToLink);

                              if (result.isEmpty) {
                                return;
                              }

                              store.inheritChoiceAnswers(
                                  choiceAnswersToInherit: result,
                                  idOfSubmissionWhichInherits: submission.id);
                            } catch (e) {
                              await showDialog<Submission>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ExceptionDialog(
                                        exception:
                                            AppLocalizations.of(context)!.errIncorrectInherit(e));
                                  });
                            }
                          },
                          tileColor: store.enabledByPath.value[path] == false
                              ? Colors.red
                              : null,
                        );
                      }),
                ],
              ),
            );
          } else {
            throw StateError(AppLocalizations.of(context)!.errNoViewDefined(question.title));
          }
        }, childCount: questions.length))
      ],
      cacheExtent: 4000,
    );
  }

  Future<bool> deleteSubmissionLink(BuildContext context, Submission linkedSubmission,
      Store store, SubmissionLink submissionLink) async {
    final dialogAnswer = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
              title:
                  AppLocalizations.of(context)!.unlinkSubmissionInheritTitle(linkedSubmission.title),
              contentText:
                  AppLocalizations.of(context)!.unlinkSubmissionInheritContentText(linkedSubmission.title),
              acceptTitle:
                  AppLocalizations.of(context)!.unlinkSubmissionInheritAcceptTitle,
              cancelTitle: AppLocalizations.of(context)!.unlinkSubmissionInheritCancelTitle);
        });

    final delete = dialogAnswer == true;
    if (delete) {
      await store.deleteSubmissionLink(submissionLink: submissionLink);
      await store.deleteInheritedPropertiesFromSubmission(submissionLink: submissionLink);
    }
    return delete;
  }
}

class DisabledChoiceQuestionCard extends StatelessWidget {
  const DisabledChoiceQuestionCard({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    final surveyType = SelectedSurvey.of(context);

    return Card(
      color: Colors.white70,
      child: ListTile(
          title: RichText(
              text: TextSpan(style: const TextStyle(fontSize: 16), children: [
            TextSpan(
              text: question.title,
              style: const TextStyle(color: Colors.black87),
            ),
            TextSpan(
                text:
                    AppLocalizations.of(context)!.hiddenBySelectionsText,
                style: const TextStyle(color: Colors.black45))
          ])),
          subtitle: const ChoiceQuestionError(),
          leading: const Icon(Icons.ac_unit_rounded),
          onTap: () {
            final enabledIf = question.enabledIf;

            if (enabledIf is Condition) {
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    duration: const Duration(minutes: 10),
                    content: ConditionChart(
                      condition: enabledIf
                    )));

              return;
            }

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  duration: const Duration(minutes: 10),
                  content: Text("${question.enabledIf}")));
          }),
    );
  }
}

class ContainsAnyOfChart extends StatelessWidget {
  const ContainsAnyOfChart({super.key, required this.condition});

  final ContainsAnyOf condition;

  @override
  Widget build(BuildContext context) {
    final vm = GetIt.I.get<ViewModel>();
    final store = GetIt.I.get<Store>();

    final surveyType = SelectedSurvey.of(context);
    final submission = SelectedSubmission.of(context);

    final questionsAndChoicesByPath = surveyType.questionsAndChoicesByPath;
    final questionByPath = questionsAndChoicesByPath.questionByPathMap;
    final choicesByPath = questionsAndChoicesByPath.choicesByPathMap;

    final field = condition.field;
    final path = SurveyEntryPath((b) => b.leafQuestion = field);
    final question = questionByPath[path] as ChoiceQuestion;


    final choices = condition.values
        .map((value) {
          // BUG: This should fail now

          final path = SurveyEntryPath((b) => b
            ..chainElements.add(SurveyEntryPathElement((b) => b
              ..question = field
              ..answer = value)));

          return choicesByPath[path];
        })
        .whereNotNull()
        .toList();

    return StreamBuilder(
        stream: vm.choiceQuestionAnswerViewModel.changed
            .map((_) => submission.getAnswers(vm: vm, path: path))
            .distinct(),
        builder: (context, snapshot) {
          final answers = submission.getAnswers(vm: vm, path: path);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!
                  .questionRequiredValuesText(question.title)),
              for (final choice in choices)
                Row(
                  children: [
                    Checkbox(
                      shape: question is SingleChoiceQuestion
                          ? const CircleBorder()
                          : null,
                      value: answers
                          .any((answer) => answer.answer == choice.value),
                      onChanged: (selected) async {
                        if (selected == null) {
                          return;
                        }
                        ChoiceQuestionAnswerService.of(context).onChangedChoice(
                            question: question,
                            questionPath: path,
                            choicePath: path.getChoicePath(choice.value),
                            choice: choice,
                            choiceQuestionAnswer: answers.singleWhereOrNull(
                                (answer) => answer.answer == choice.value),
                            submission: submission,
                            context: context);
                      },
                    ),
                    Text(choice.title),
                  ],
                ),
            ],
          );
        });
  }
}

class ContainsNoneOfChart extends StatelessWidget {
  const ContainsNoneOfChart({
    super.key,
    required this.condition,
  });

  final ContainsNoneOf condition;

  @override
  Widget build(BuildContext context) {
    final vm = GetIt.I.get<ViewModel>();
    final store = GetIt.I.get<Store>();

    final survey = SelectedSurvey.of(context);
    final submission = SelectedSubmission.of(context);

    final questionsAndChoicesByPath = survey.questionsAndChoicesByPath;
    final questionByPath = questionsAndChoicesByPath.questionByPathMap;
    final choicesByPath = questionsAndChoicesByPath.choicesByPathMap;

    final field = condition.field;
    final path = SurveyEntryPath((b) => b.leafQuestion = field);
    final question = questionByPath[path] as ChoiceQuestion;

    final choices = condition.values
        .map((value) {
            // BUG: This should fail now

            final path = SurveyEntryPath((b) => b
            ..chainElements.add(SurveyEntryPathElement((b) => b
              ..question = field
              ..answer = value)));

          return choicesByPath[path];
        })
        .whereNotNull()
        .toList();

    return StreamBuilder(
        stream: vm.choiceQuestionAnswerViewModel.changed
            .map((_) => submission.getAnswers(vm: vm, path: path))
            .distinct(),
        builder: (context, snapshot) {
          final answers = submission.getAnswers(vm: vm, path: path);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!
                  .questionCantCotainValuesText(question.title)),
              for (final choice in choices)
                Row(
                  children: [
                    StreamBuilder<Object>(
                        stream: null,
                        builder: (context, snapshot) {
                          return Checkbox(
                            shape: question is SingleChoiceQuestion
                                ? const CircleBorder()
                                : null,
                            activeColor: Colors.red,
                            value: answers
                                .any((answer) => answer.answer == choice.value),
                            onChanged: (selected) async {
                              if (selected == null) {
                                return;
                              }
                              final selectedAnswer = answers.where((answer) =>
                                  answer.answer == choice.value &&
                                  answer.isOwnedBySubmission(submission));

                              ChoiceQuestionAnswerService.of(context)
                                  .onChangedChoice(
                                      question: question,
                                      questionPath: path,
                                      choicePath:
                                          path.getChoicePath(choice.value),
                                      choice: choice,
                                      choiceQuestionAnswer:
                                          selectedAnswer.singleOrNull,
                                      submission: submission,
                                      context: context);
                            },
                          );
                        }),
                    Text(choice.title),
                  ],
                ),
            ],
          );
        });
  }
}

class CheckAllConditionsChart extends StatelessWidget {
  const CheckAllConditionsChart({
    super.key,
    required this.condition,
  });

  final CheckAllConditions condition;

  @override
  Widget build(BuildContext context) {
    final conditions = condition.conditions;

    final firstCondition = conditions.firstOrNull;

    final allConditionsButFirst = conditions.sublist(1);

    return Column(
      children: [
        if (firstCondition != null)
          ConditionChart(
            condition: firstCondition
          ),
        for (final condition in allConditionsButFirst)
          ConditionChart(
            condition: condition
          )
      ],
    );
  }
}

class ConditionChart extends StatelessWidget {
  const ConditionChart({
    super.key,
    required this.condition
  });

  final Condition? condition;

  @override
  Widget build(BuildContext context) {
    final condition = this.condition;

    if (condition == null) {
      return Text(AppLocalizations.of(context)!.noConditionDefinedText);
    }

    if (condition is ContainsAnyOf) {
      return ContainsAnyOfChart(
        condition: condition
      );
    }

    if (condition is ContainsNoneOf) {
      return ContainsNoneOfChart(
        condition: condition
      );
    }

    if (condition is CheckAllConditions) {
      return CheckAllConditionsChart(
        condition: condition
      );
    }

    throw StateError(
        AppLocalizations.of(context)!.errConditionsText(condition.runtimeType));
  }
}
