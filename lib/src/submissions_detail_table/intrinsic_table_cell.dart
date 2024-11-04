import 'cell_sizes.dart';

import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:json_to_survey/model.dart';
import 'package:json_to_survey/view_model.dart';

import 'package:json_to_survey/src/widgets/choice_question_list_view.dart';

import 'package:json_to_survey/src/inherited_widgets/selected_survey.dart';

import 'package:json_to_survey/inherited_widgets.dart';

import 'package:json_to_survey/src/inherited_widgets/selected_submission.dart';

import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';
import 'package:flutter/widgets.dart';

class IntrinsicTableCell extends StatefulWidget {
  const IntrinsicTableCell(
      {super.key,
      required this.survey,
      required this.submission,
      required this.path,
      required this.question,
      required this.choiceQuestionAnswers,
      this.tableVicinity});

  final Survey survey;
  final Submission submission;
  final SurveyEntryPath path;
  final Question question;
  final Iterable<ChoiceQuestionAnswer> choiceQuestionAnswers;
  final TableVicinity? tableVicinity;

  @override
  State<IntrinsicTableCell> createState() => _IntrinsicTableCellState();
}

class _IntrinsicTableCellState extends State<IntrinsicTableCell> {
  GlobalKey _tableKey = GlobalKey();
  final firstColumnKeys = <int, GlobalKey>{};
  final secondColumnKeys = <int, GlobalKey>{};

  Survey get survey => widget.survey;
  Submission get submission => widget.submission;
  SurveyEntryPath get path => widget.path;
  Question get question => widget.question;
  Iterable<ChoiceQuestionAnswer> get choiceQuestionAnswers =>
      widget.choiceQuestionAnswers;
  TableVicinity? get tableVicinity => widget.tableVicinity;

  @override
  Widget build(BuildContext context) {
    final widgetsBinding = WidgetsBinding.instance;
    final tableVicinity = this.tableVicinity;
    if (tableVicinity != null && mounted) {
      widgetsBinding.addPostFrameCallback((a) {
        if (!mounted) {
          return;
        }

        double sumOfHeigts = 0;

        for (final keyIndex in firstColumnKeys.keys) {
          final firstColumnKey = firstColumnKeys[keyIndex]!;
          final secondColumnKey = secondColumnKeys[keyIndex]!;

          final renderBox1 =
              firstColumnKey.currentContext?.findRenderObject() as RenderBox?;
          if (renderBox1 == null) {
            return;
          }
          final height1 = renderBox1.size.height;

          final renderBox2 =
              secondColumnKey.currentContext?.findRenderObject() as RenderBox?;

          if (renderBox2 == null) {
            return;
          }
          final height2 = renderBox2.size.height;

          sumOfHeigts += max(height1, height2);
        }

        final renderBox1 = firstColumnKeys[0]
            ?.currentContext
            ?.findRenderObject() as RenderBox?;
        final renderBox2 = secondColumnKeys[0]
            ?.currentContext
            ?.findRenderObject() as RenderBox?;

        final width =
            (renderBox1?.size.width ?? 0.0) + (renderBox2?.size.width ?? 0.0);

        final height = sumOfHeigts;

        final widthBefore =
            GetIt.I.get<CellSizesService>().cellWidths[tableVicinity.column] ??
                0;
        final heightBefore =
            GetIt.I.get<CellSizesService>().cellHeights[tableVicinity.row] ?? 0;

        if (widthBefore < width) {
          GetIt.I.get<CellSizesService>().cellWidths[tableVicinity.column] =
              width + 16;
        }
        if (heightBefore < height) {
          GetIt.I.get<CellSizesService>().cellHeights[tableVicinity.row] =
              height + 4;
        }

        if (widthBefore < width || heightBefore < height) {
          GetIt.I.get<CellSizesService>().repaintTable.add(true);
        }
      });
    }

    final questionsAndChoicesByPath = survey.questionsAndChoicesByPath;
    final questionByPath = questionsAndChoicesByPath.questionByPathMap;
    final choicesByPath = questionsAndChoicesByPath.choicesByPathMap;

    final question = questionByPath[path];

    if (question is ChoiceQuestion) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Builder(builder: (context) {
          return StreamBuilder(
              stream: GetIt.I
                  .get<ViewModel>()
                  .choiceQuestionAnswerViewModel
                  .changed,
              builder: (context, snapshot) {
                var answersByPath = submission.answersByPath;

                final Iterable<ChoiceQuestionAnswer> answersForColumn =
                    answersByPath[path]?.values ?? {};

                var choices = answersForColumn.map((answer) {
                  var choice = question.choices
                      .singleWhere((choice) => choice.value == answer.answer);

                  return MapEntry<ChoiceQuestionAnswer, Choice>(answer, choice);
                });

                final choicesByAnswers = Map.fromEntries(choices);

                if (choicesByAnswers.isEmpty) {
                  return InkWell(
                    child: Text("\"\""),
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: ChoiceQuestionAnswerService(
                                submission: submission,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  child: SelectedSurvey(
                                    selectedSurvey: survey,
                                    child: SelectedSubmission(
                                      selectedSubmission: submission,
                                      child: Scaffold(
                                        body: StreamBuilder(
                                            stream: GetIt.I
                                                .get<ViewModel>()
                                                .choiceQuestionAnswerViewModel
                                                .changed,
                                            builder: (context, snapshot) {
                                              return ChoiceQuestionListView(
                                                  submission: submission,
                                                  question: question,
                                                  path: path,
                                                  onUpdateChoiceQuestionAnswer: (
                                                          {required choice,
                                                          required choicePath,
                                                          required choiceQuestionAnswer,
                                                          required question,
                                                          required questionPath,
                                                          required submission}) =>
                                                      print(
                                                          "TODO: implement onUpdateChoiceQuestionAnswer"),
                                                  vm: GetIt.I.get<ViewModel>());
                                            }),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                  );
                }

                return Table(
                  key: _tableKey,
                  border: TableBorder.all(),
                  defaultColumnWidth: IntrinsicColumnWidth(),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    for (final (index, answer) in choicesByAnswers.keys.indexed)
                      TableRow(
                        decoration: const BoxDecoration(),
                        children: <Widget>[
                          Container(
                            key: firstColumnKeys.putIfAbsent(
                                index, () => GlobalKey()),
                            padding: EdgeInsets.all(4),
                            child: InkWell(
                              child: Text(choicesByAnswers[answer]!.title,
                                  style: switch (answer.isInherited) {
                                    true =>
                                      TextStyle(fontStyle: FontStyle.italic),
                                    false =>
                                      TextStyle(fontStyle: FontStyle.normal),
                                  }),
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        content: ChoiceQuestionAnswerService(
                                          submission: submission,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.8,
                                            child: SelectedSurvey(
                                              selectedSurvey: survey,
                                              child: SelectedSubmission(
                                                selectedSubmission: submission,
                                                child: Scaffold(
                                                  body: StreamBuilder(
                                                      stream: GetIt.I
                                                          .get<ViewModel>()
                                                          .choiceQuestionAnswerViewModel
                                                          .changed,
                                                      builder:
                                                          (context, snapshot) {
                                                        return ChoiceQuestionListView(
                                                            submission:
                                                                submission,
                                                            question: question,
                                                            path: path,
                                                            onUpdateChoiceQuestionAnswer: (
                                                                    {required choice,
                                                                    required choicePath,
                                                                    required choiceQuestionAnswer,
                                                                    required question,
                                                                    required questionPath,
                                                                    required submission}) =>
                                                                print(
                                                                    "TODO: implement onUpdateChoiceQuestionAnswer"),
                                                            vm: GetIt.I.get<
                                                                ViewModel>());
                                                      }),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                            ),
                          ),
                          if (choicesByAnswers[answer]!
                                  .subQuestions
                                  .isNotEmpty ||
                              answer.concretisations.isNotEmpty)
                            StreamBuilder(
                                stream: GetIt.I
                                    .get<ViewModel>()
                                    .concretisationsViewModel
                                    .changed,
                                builder: (context, snapshot) {
                                  return Table(
                                    key: secondColumnKeys.putIfAbsent(
                                        index, () => GlobalKey()),
                                    border: TableBorder.all(),
                                    defaultColumnWidth: IntrinsicColumnWidth(),
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: <TableRow>[
                                      TableRow(
                                        children: <Widget>[
                                          if (answer.concretisations.isNotEmpty)
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text("Concretisations",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          for (final subQuestion
                                              in choicesByAnswers[answer]!
                                                  .subQuestions
                                                  .map((subQuestion) => subQuestion
                                                      .resolveConcreteQuestion(
                                                          survey))
                                                  .toList())
                                            if (subQuestion is Question)
                                              Container(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(subQuestion.title,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)))
                                        ],
                                      ),
                                      TableRow(
                                        children: <Widget>[
                                          if (answer.concretisations.isNotEmpty)
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Column(
                                                  children: answer
                                                      .concretisations
                                                      .map((concretisation) {
                                                    var value = concretisation
                                                        .concretisationValue;
                                                    if (value
                                                        is TextConcretisation) {
                                                      return Text(value.text);
                                                    } else if (value
                                                        is DecimalConcretisation) {
                                                      return Text(
                                                          value.decimal);
                                                    } else if (value
                                                        is ZeitVorgabeConcretisation) {
                                                      return Text(
                                                          "von Tag: ${value.vonTag} von Monat: ${value.vonMonat} bis Tag: ${value.bisTag} bis Monat: ${value.bisMonat} Dauer in Stunden: ${value.dauerInStunden} text: ${value.textConcretisation}");
                                                    } else if (value
                                                        is MengenVorgabeConcretisation) {
                                                      return Text(
                                                          "vorzeichenMin: ${value.vorzeichenMin} zahlMin: ${value.zahlMin} vorzeichenMax: ${value.vorzeichenMax} zahlMax: ${value.zahlMax} zaehler: ${value.zaehler} nenner: ${value.nenner} text: ${value.textConcretisation}");
                                                    } else {
                                                      return Text(
                                                          "Konkretisierungstyp unbekannt: ${value.runtimeType}");
                                                    }
                                                  }).toList(),
                                                )),
                                          for (final subQuestion
                                              in choicesByAnswers[answer]!
                                                  .subQuestions
                                                  .map((subQuestion) => subQuestion
                                                      .resolveConcreteQuestion(
                                                          survey))
                                                  .toList())
                                            if (subQuestion is Question)
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: IntrinsicTableCell(
                                                    survey: survey,
                                                    path: path
                                                        .appendAnswer(
                                                            choicesByAnswers[
                                                                answer]!)
                                                        .appendQuestion(
                                                            subQuestion),
                                                    choiceQuestionAnswers:
                                                        choiceQuestionAnswers,
                                                    question: question,
                                                    submission: submission),
                                              )
                                        ],
                                      )
                                    ],
                                  );
                                })
                          else
                            SizedBox.shrink(
                                key: secondColumnKeys.putIfAbsent(
                                    index, () => GlobalKey())),
                        ],
                      ),
                  ],
                );
              });
        }),
      );
    }
    return Text(path.toString());
  }
}
