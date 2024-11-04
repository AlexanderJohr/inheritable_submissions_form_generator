import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/inherited_widgets.dart';
import 'package:json_to_survey/src/dialogs/exception_dialog.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_submission.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_survey.dart';
import 'package:json_to_survey/src/store/store.dart';
import 'package:json_to_survey/src/submission_detail/submission_detail_view.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:json_to_survey/src/widgets/app_state.dart';
import 'package:json_to_survey/src/widgets/concretisations/decimal_concretisation/decimal_concretisation_view.dart';
import 'package:json_to_survey/src/widgets/concretisations/mengen_vorgabe_concretisation/mengen_vorgabe_concretisation_view.dart';
import 'package:json_to_survey/src/widgets/concretisations/zeit_vorgabe_concretisation/zeit_vorgabe_concretisation_view.dart';
import 'package:json_to_survey/src/widgets/questions_list_view.dart';
import 'package:rxdart/rxdart.dart';

import '../view_model/view_models.dart';
import 'concretisations/text_concretisation/text_concretisation_view.dart';

final defaultAllowedConcretisations = BuiltMap<String, bool>({"Text": true, "Zeitvorgabe": true, "Mengenvorgabe": true});

typedef OnUpdateChoiceQuestionAnswer = void Function(
    {required ChoiceQuestion question,
    required Choice? choice,
    required ChoiceQuestionAnswer? choiceQuestionAnswer,
    required SurveyEntryPath questionPath,
    required SurveyEntryPath choicePath,
    required Submission submission});

class ChoiceListTile extends StatelessWidget {
  const ChoiceListTile({
    super.key,
    required this.questionPath,
    required this.question,
    required this.selectedChoice,
    this.choiceQuestionAnswer,
    required this.onUpdateChoiceQuestionAnswer,
  });

  final SurveyEntryPath questionPath;
  final ChoiceQuestion question;
  final ChoiceQuestionAnswer? choiceQuestionAnswer;
  final Choice? selectedChoice;
  final OnUpdateChoiceQuestionAnswer onUpdateChoiceQuestionAnswer;

  bool get answerNotPresentInSubmission => choiceQuestionAnswer != null && selectedChoice == null;

  String getKey(bool enabled) {
    final choiceQuestionAnswer = this.choiceQuestionAnswer;
    final selectedChoice = this.selectedChoice;

    if (selectedChoice == null) {
      return "from database deleted choice ${question.id} - ${choiceQuestionAnswer!.answer}";
    }

    if (enabled) {
      return "enabled choice ${question.id} - ${selectedChoice.value}";
    }

    return "disabled choice ${question.id} - ${selectedChoice.value}";
  }

  String get title {
    final choiceQuestionAnswer = this.choiceQuestionAnswer;
    final selectedChoice = this.selectedChoice;
    if (selectedChoice == null) {
      return choiceQuestionAnswer!.answer;
    }

    return selectedChoice.title;
  }

  bool getIsSelected(Submission submission) {
    final choiceQuestionAnswer = this.choiceQuestionAnswer;
    return choiceQuestionAnswer != null && choiceQuestionAnswer.submissionId == submission.id;
  }

  bool getIsOwn(Submission submission) {
    final choiceQuestionAnswer = this.choiceQuestionAnswer;
    return choiceQuestionAnswer != null && choiceQuestionAnswer.submissionId == choiceQuestionAnswer.linkedSubmissionId;
  }

// TODO: Brauche ich das noch, wo ich enabled nun global speichere?
  bool checkEnabled(ViewModel vm, {required Submission submission}) {
    final selectedChoice = this.selectedChoice;

    if (selectedChoice == null) {
      return true;
    }

    final enabledIf = selectedChoice.enabledIf;
    if (enabledIf == null) {
      return true;
    }

    final enabled = enabledIf.check((field) {
      final path = SurveyEntryPath((b) => b.leafQuestion = field);
      final valuesForField = submission.getAnswers(vm: vm, path: path);

      return valuesForField.map((v) => v.answer).toBuiltSet();
    });

    return enabled;
  }

  SurveyEntryPath get choicePath {
    return questionPath.getChoicePath((selectedChoice?.value ?? choiceQuestionAnswer?.answer)!);
  }

  MaterialColor? getTileColor(BuildContext context,
      {required bool inheritationIsBroken, required bool inheritationToChildIsBroken, required bool isEnabled}) {
    if (answerNotPresentInSubmission) {
      return Colors.red;
    }

    if (isEnabled == false) {
      return Colors.red;
    }

    if (inheritationIsBroken) {
      return Colors.red;
    }

    if (inheritationToChildIsBroken) {
      return Colors.red;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final choiceQuestionAnswer = this.choiceQuestionAnswer;
    final selectedChoice = this.selectedChoice;

    var vm = GetIt.I.get<ViewModel>();

    final store = GetIt.I.get<Store>();

    final surveyType = SelectedSurvey.of(context);

    final submission = SelectedSubmission.of(context);

    final selectedChoicesInPath = submission.getAnswers(vm: vm, path: questionPath);

    final choicePath = this.choicePath;

    final submissionsWhichInherit = (choiceQuestionAnswer ?? selectedChoice)
            ?.getAnswersOfInheritingSubmissionsRecursivly(submission: submission, path: choicePath, vm: vm)
            .where((cqa) => cqa.isInheritingFromSubmission(submission))
            .map((c) => c.getSubmission(vm))
            .toSet() ??
        {};
    final submissionsWhichDefineTheSame = (choiceQuestionAnswer ?? selectedChoice)
            ?.getAnswersOfInheritingSubmissionsRecursivly(submission: submission, vm: vm, path: choicePath)
            .where((cqa) => !cqa.isInheritingFromSubmission(submission))
            .map((c) => c.getSubmission(vm))
            .toSet() ??
        {};

    final enabled = checkEnabled(vm, submission: submission);

    final inheritationToChildIsBroken = choiceQuestionAnswer == null && submissionsWhichInherit.isNotEmpty;

    final key = getKey(enabled);

    final enabledIf = selectedChoice?.enabledIf;

    bool anserIsSetButChoiceDoesntExist = choiceQuestionAnswer != null && selectedChoice == null;

    bool isSelected = getIsSelected(SelectedSubmission.of(context));

    bool isInherited = choiceQuestionAnswer != null && choiceQuestionAnswer.linkedSubmissionId != submission.id && isSelected;

    final parentChoice = choiceQuestionAnswer?.getParentAnsers(vm: vm, path: choicePath);
    final inheritationFromParentIsBroken = isInherited && (parentChoice == null || parentChoice.isEmpty);

    bool isInheritable = choiceQuestionAnswer != null && choiceQuestionAnswer.linkedSubmissionId != submission.id && !isSelected;

    // TODO: fix isEnabled: choicePath shoulde be questionPath and tilecollor should be correct
    final enabledByPath = store.enabledByPath.value[choicePath];
    final isEnabled = enabledByPath == null || enabledByPath == true;

    final tileColor = getTileColor(context,
        inheritationIsBroken: inheritationFromParentIsBroken, inheritationToChildIsBroken: inheritationToChildIsBroken, isEnabled: isEnabled);

    final description = selectedChoice?.description;

    final linkedChoiceQuestionAnswer = choiceQuestionAnswer?.getLinkedChoiceQuestionAnswer(vm, choicePath: choicePath);

    final concretisationsChanged = vm.concretisationsViewModel.changed
        .map((_) => linkedChoiceQuestionAnswer?.getConcretisations(vm))
        .whereNotNull()
        .distinct((previous, next) => previous.length == next.length);

    final questionAllowedConcretisations = question.allowedConcretisations;
    final choiceAllowedConcretisations = selectedChoice?.allowedConcretisations;

    final allowedConcretisations = defaultAllowedConcretisations.rebuild((b) {
      if (questionAllowedConcretisations != null) {
        b.addAll(questionAllowedConcretisations.asMap());
      }

      if (choiceAllowedConcretisations != null) {
        b.addAll(choiceAllowedConcretisations.asMap());
      }
    });

    return ListTile(
        key: Key(key),
        leading: enabled || choiceQuestionAnswer != null
            ? Checkbox(
                value: isSelected,
                onChanged: (selected) {
                  if (selected == null) {
                    return;
                  }

                  ChoiceQuestionAnswerService.of(context).onChangedChoice(
                      question: question,
                      questionPath: questionPath,
                      choicePath: choicePath,
                      choice: selectedChoice,
                      choiceQuestionAnswer: choiceQuestionAnswer,
                      submission: submission,
                      context: context);

                  onUpdateChoiceQuestionAnswer(
                      question: question,
                      questionPath: questionPath,
                      choicePath: choicePath,
                      choice: selectedChoice,
                      choiceQuestionAnswer: choiceQuestionAnswer,
                      submission: submission);
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: question is SingleChoiceQuestion ? const CircleBorder() : null,
              )
            : const Icon(Icons.ac_unit_rounded),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  // TODO: In Condition Chart verschieben?
                  final questionsAndChoicesByPath = surveyType.questionsAndChoicesByPath;

                  final questionByPath = questionsAndChoicesByPath.questionByPathMap;

                  final choicesByPath = questionsAndChoicesByPath.choicesByPathMap;

                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(duration: const Duration(minutes: 10), content: ConditionChart(condition: enabledIf)));
                }),
            if (choiceQuestionAnswer != null && allowedConcretisations.values.any((a) => a == true))
              PopupMenuButton(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: const Icon(Icons.add),
                ),
                itemBuilder: (context) => <PopupMenuEntry>[
                  if (allowedConcretisations["Text"] == true)
                    PopupMenuItem(
                      value: 1,
                      onTap: () {
                        store.addConcretisation(choiceQuestionAnswer: choiceQuestionAnswer, concretisation: TextConcretisation((b) => b.text = ""));
                      },
                      child: Text(AppLocalizations.of(context)!.freeText),
                    ),
                  if (allowedConcretisations["Zeitvorgabe"] == true && allowedConcretisations["Text"] == true) const PopupMenuDivider(),
                  if (allowedConcretisations["Zeitvorgabe"] == true)
                    PopupMenuItem(
                      value: 2,
                      onTap: () {
                        store.addConcretisation(choiceQuestionAnswer: choiceQuestionAnswer, concretisation: ZeitVorgabeConcretisation((b) => b));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.timeLimitText,
                        softWrap: false,
                      ),
                    ),
                  /*if (allowedConcretisations["Mengenvorgabe"] == true && allowedConcretisations["Zeitvorgabe"] == true) const PopupMenuDivider(),
                  if (allowedConcretisations["Mengenvorgabe"] == true)
                    PopupMenuItem(
                      value: 4,
                      onTap: () {
                        store.addConcretisation(
                            choiceQuestionAnswer: choiceQuestionAnswer,
                            concretisation: MengenVorgabeConcretisation((b) => b
                              ..zahlMin = "0"
                              ..zahlMax = "0"));
                      },
                      child: Text(AppLocalizations.of(context)!.quantityAndAraSpecificationText),
                    ),*/
                ],
              ),
            if (choiceQuestionAnswer != null && allowedConcretisations.values.any((a) => a == true))
              PopupMenuButton(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: const Icon(Icons.add),
                ),
                itemBuilder: (context) => <PopupMenuEntry>[
                  if (allowedConcretisations["Text"] == true)
                    PopupMenuItem(
                      value: 1,
                      onTap: () {
                        store.addConcretisation(choiceQuestionAnswer: choiceQuestionAnswer, concretisation: TextConcretisation((b) => b.text = ""));
                      },
                      child: Text(AppLocalizations.of(context)!.freeText),
                    ),
                  if (allowedConcretisations["Zeitvorgabe"] == true && allowedConcretisations["Text"] == true) const PopupMenuDivider(),
                  if (allowedConcretisations["Zeitvorgabe"] == true)
                    PopupMenuItem(
                      value: 2,
                      onTap: () {
                        store.addConcretisation(choiceQuestionAnswer: choiceQuestionAnswer, concretisation: ZeitVorgabeConcretisation((b) => b));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.timeLimitText,
                        softWrap: false,
                      ),
                    ),
                  /*if (allowedConcretisations["Mengenvorgabe"] == true && allowedConcretisations["Zeitvorgabe"] == true) const PopupMenuDivider(),
                  if (allowedConcretisations["Mengenvorgabe"] == true)
                    PopupMenuItem(
                      value: 4,
                      onTap: () {
                        store.addConcretisation(
                            choiceQuestionAnswer: choiceQuestionAnswer,
                            concretisation: MengenVorgabeConcretisation((b) => b
                              ..zahlMin = "0"
                              ..zahlMax = "0"));
                      },
                      child: Text(AppLocalizations.of(context)!.quantityAndAraSpecificationText),
                    ),*/
                ],
              ),
            if (choiceQuestionAnswer != null && allowedConcretisations.values.any((a) => a == true))
              PopupMenuButton(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: const Icon(Icons.add),
                ),
                itemBuilder: (context) => <PopupMenuEntry>[
                  if (allowedConcretisations["Text"] == true)
                    PopupMenuItem(
                      value: 1,
                      onTap: () {
                        store.addConcretisation(choiceQuestionAnswer: choiceQuestionAnswer, concretisation: TextConcretisation((b) => b.text = ""));
                      },
                      child: Text(AppLocalizations.of(context)!.freeText),
                    ),
                  if (allowedConcretisations["Zeitvorgabe"] == true && allowedConcretisations["Text"] == true) const PopupMenuDivider(),
                  if (allowedConcretisations["Zeitvorgabe"] == true)
                    PopupMenuItem(
                      value: 2,
                      onTap: () {
                        store.addConcretisation(choiceQuestionAnswer: choiceQuestionAnswer, concretisation: ZeitVorgabeConcretisation((b) => b));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.timeLimitText,
                        softWrap: false,
                      ),
                    ),
                  /*if (allowedConcretisations["Mengenvorgabe"] == true && allowedConcretisations["Zeitvorgabe"] == true) const PopupMenuDivider(),
                  if (allowedConcretisations["Mengenvorgabe"] == true)
                    PopupMenuItem(
                      value: 4,
                      onTap: () {
                        store.addConcretisation(
                            choiceQuestionAnswer: choiceQuestionAnswer,
                            concretisation: MengenVorgabeConcretisation((b) => b
                              ..zahlMin = "0"
                              ..zahlMax = "0"));
                      },
                      child: Text(AppLocalizations.of(context)!.quantityAndAraSpecificationText),
                    ),*/
                ],
              ),
            if (choiceQuestionAnswer != null && allowedConcretisations.values.any((a) => a == true))
              PopupMenuButton(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: const Icon(Icons.add),
                ),
                itemBuilder: (context) => <PopupMenuEntry>[
                  if (allowedConcretisations["Text"] == true)
                    PopupMenuItem(
                      value: 1,
                      onTap: () {
                        store.addConcretisation(choiceQuestionAnswer: choiceQuestionAnswer, concretisation: TextConcretisation((b) => b.text = ""));
                      },
                      child: Text(AppLocalizations.of(context)!.freeText),
                    ),
                  if (allowedConcretisations["Zeitvorgabe"] == true && allowedConcretisations["Text"] == true) const PopupMenuDivider(),
                  if (allowedConcretisations["Zeitvorgabe"] == true)
                    PopupMenuItem(
                      value: 2,
                      onTap: () {
                        store.addConcretisation(choiceQuestionAnswer: choiceQuestionAnswer, concretisation: ZeitVorgabeConcretisation((b) => b));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.timeLimitText,
                        softWrap: false,
                      ),
                    ),
                  /*if (allowedConcretisations["Mengenvorgabe"] == true && allowedConcretisations["Zeitvorgabe"] == true) const PopupMenuDivider(),
                  if (allowedConcretisations["Mengenvorgabe"] == true)
                    PopupMenuItem(
                      value: 4,
                      onTap: () {
                        store.addConcretisation(
                            choiceQuestionAnswer: choiceQuestionAnswer,
                            concretisation: MengenVorgabeConcretisation((b) => b
                              ..zahlMin = "0"
                              ..zahlMax = "0"));
                      },
                      child: Text(AppLocalizations.of(context)!.quantityAndAraSpecificationText),
                    ),*/
                ],
              ),
          ],
        ),
        title: Text(title,
            style: TextStyle(
              color: enabled ? null : Colors.grey,
              decoration: enabled ? null : TextDecoration.lineThrough,
              fontStyle: isInherited ? FontStyle.italic : null,
            )),
        tileColor: tileColor,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (description != null) Text(description, style: const TextStyle(fontWeight: FontWeight.w400)),
            if (submissionsWhichInherit.isNotEmpty)
              RichText(
                  text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: AppLocalizations.of(context)!.passedOnToText),
                  TextSpan(text: submissionsWhichInherit.map((s) => s.title).join(",\n"), style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              )),
            if (submissionsWhichDefineTheSame.isNotEmpty)
              RichText(
                  text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: AppLocalizations.of(context)!.notPassedOnButDefinedText),
                  TextSpan(text: submissionsWhichDefineTheSame.map((s) => s.title).join(",\n"), style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              )),
            if (isInherited)
              RichText(
                  text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: AppLocalizations.of(context)!.inheritedFromText),
                  TextSpan(text: choiceQuestionAnswer.getLinkedSubmission(vm).title, style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              )),
            if (isInheritable)
              RichText(
                  text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: AppLocalizations.of(context)!.canBeInheritedFromText),
                  TextSpan(
                      text: vm.submissionViewModel.byId[choiceQuestionAnswer.linkedSubmissionId]?.title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              )),
            if (anserIsSetButChoiceDoesntExist)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppLocalizations.of(context)!.errChoiceQuestionAnswerDoesntExistText(choiceQuestionAnswer.answer)),
              ),
            if (isInherited && anserIsSetButChoiceDoesntExist)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppLocalizations.of(context)!
                    .errCheckParentAnswerInheritText(vm.submissionViewModel.byId[choiceQuestionAnswer.linkedSubmissionId]?.title)),
              ),
            if (inheritationFromParentIsBroken)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppLocalizations.of(context)!
                    .errIncorrectLinkingToParentText(vm.submissionViewModel.byId[choiceQuestionAnswer.linkedSubmissionId]?.title)),
              ),
            if (inheritationToChildIsBroken)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    AppLocalizations.of(context)!.errInheritedAnswerWithoutSubmissionText(submissionsWhichInherit.map((s) => s.title).join(", "))),
              ),
            if (isSelected && selectedChoice != null)
              QuestionsListView(
                path: choicePath,
                questions: selectedChoice.subQuestions.asList(),
                errorText: null,
                shrinkWrap: true,
              ),
            if (isSelected && choiceQuestionAnswer != null && linkedChoiceQuestionAnswer != null)
              StreamBuilder(
                  stream: vm.concretisationsViewModel.changed,
                  builder: (context, snapshot) {
                    final concretisations = choiceQuestionAnswer.getConcretisations(vm);
                    if (concretisations.isEmpty) {
                      return SizedBox.shrink();
                    }
                    concretisations.sorted((a, b) => b.orderIndex - a.orderIndex);

                    return Container(
                      color: const Color.fromARGB(255, 168, 228, 255),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppLocalizations.of(context)!.cautionConcretisationOfParentText),
                          ConcretisationListView(
                            concretisations: concretisations,
                            path: questionPath,
                            question: question,
                          ),
                        ],
                      ),
                    );
                  }),
            if (isSelected && choiceQuestionAnswer != null)
              StreamBuilder(
                  stream: vm.concretisationsViewModel.changed,
                  builder: (context, snapshot) {
                    final concretisations = choiceQuestionAnswer.getConcretisations(vm);

                    concretisations.sorted((a, b) => b.orderIndex - a.orderIndex);

                    return ConcretisationListView(
                      concretisations: concretisations,
                      path: questionPath,
                      question: question,
                    );
                  })
          ],
        ));
  }
}

class ConcretisationListView extends StatelessWidget {
  const ConcretisationListView({super.key, required this.concretisations, required this.path, required this.question});

  final Iterable<Concretisation> concretisations;

  final SurveyEntryPath path;
  final ChoiceQuestion question;

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I.get<Store>();

    return Column(
      children: [
        for (final concretisation in concretisations)
          Row(
            children: [
              Expanded(
                flex: 1,
                child: ConcretisationView(
                  path: path,
                  question: question,
                  concretisation: concretisation,
                  key: ValueKey<int>(concretisation.id),
                  onUpdateConcretisation: (concretisation) {
                    store.updateConcretisation(concretisation);
                  },
                ),
              ),
              Expanded(
                  flex: 0,
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      final dialogContext = context;

                      runZonedGuarded(() async {
                        store.deleteConcretisation(concretisations: BuiltSet([concretisation]));
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
                  ))
            ],
          )
      ],
    );
  }
}

typedef OnUpdateConcretisation = void Function(Concretisation concretisation);

class ConcretisationView extends StatelessWidget {
  const ConcretisationView({
    super.key,
    required this.concretisation,
    required this.onUpdateConcretisation,
    required this.path,
    required this.question,
  });

  final Concretisation concretisation;

  final SurveyEntryPath path;
  final ChoiceQuestion question;

  final OnUpdateConcretisation onUpdateConcretisation;

  @override
  Widget build(BuildContext context) {
    final concretisationValue = concretisation.concretisationValue;

    if (concretisationValue is TextConcretisation) {
      return TextConcretisationView(
        concretisationValue: concretisationValue,
        onChanged: (updatedConcretisationValue) {
          onUpdateConcretisation(concretisation.rebuild((b) => b..concretisationValue = updatedConcretisationValue));
        },
      );
    } else if (concretisationValue is DecimalConcretisation) {
      return DecimalConcretisationView(
        concretisation: concretisationValue,
        onChanged: (DecimalConcretisation updatedConcretisationValue) {
          onUpdateConcretisation(concretisation.rebuild((b) => b..concretisationValue = updatedConcretisationValue));
        },
      );
    } else if (concretisationValue is MengenVorgabeConcretisation) {
      return MengenVorgabeConcretisationView(
        concretisation: concretisationValue,
        question: question,
        path: path,
        onChanged: (MengenVorgabeConcretisation updatedConcretisationValue) {
          onUpdateConcretisation(concretisation.rebuild((b) => b..concretisationValue = updatedConcretisationValue));
        },
      );
    } else if (concretisationValue is ZeitVorgabeConcretisation) {
      return ZeitVorgabeConcretisationView(
          concretisation: concretisationValue,
          onChanged: (ZeitVorgabeConcretisation updatedConcretisationValue) {
            onUpdateConcretisation(concretisation.rebuild((b) => b..concretisationValue = updatedConcretisationValue));
          });
    } else {
      return const Placeholder();
    }
  }
}
