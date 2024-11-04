import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_survey.dart';
import 'package:json_to_survey/src/view_model/view_models.dart';
import 'package:json_to_survey/value_types.dart';
import 'choice_filter_service.dart';
import 'cell_sizes.dart';
import 'intrinsic_table_cell.dart';
import 'filterable_table_cell.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';
import 'package:rxdart/rxdart.dart';

class SubmissionTable extends StatelessWidget {
  final Map<TableVicinity, Size> cellSizes = {};

  SubmissionTable();

  @override
  Widget build(BuildContext context) {
    final survey = SelectedSurvey.of(context);
    final surveyStructure = survey.structure;
    final submissions = survey.submissions;

    var questions = surveyStructure.questions.whereType<ChoiceQuestion>().toList();
    var questionColumns = surveyStructure.questions.whereType<ChoiceQuestion>().map((q) => DataColumn(label: Text(q.title))).toList();

    // Zugriff auf das aktuelle Farbschema
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;

    return StreamBuilder(
        stream: Rx.merge([
          GetIt.I.get<ChoiceFilterService>().changed,
          GetIt.I.get<CellSizesService>().repaintTable,
          GetIt.I.get<ViewModel>().choiceQuestionAnswerViewModel.changed,
          GetIt.I.get<ViewModel>().concretisationsViewModel.changed,
        ]),
        builder: (context, snapshot) {
          final filterService = GetIt.I.get<ChoiceFilterService>();

          final List<Submission> filteredSubmissions = filterService.getFilteredSubmissions(submissions);

          return TableView.builder(
            pinnedColumnCount: 1,
            pinnedRowCount: 1,
            cellBuilder: (BuildContext context, TableVicinity vicinity) {
              final questionIndex = vicinity.column - 1;

              if (vicinity.row == 0) {
                if (vicinity.column == 0) {
                  return TableViewCell(
                    child: Center(
                      child: Text(
                        "Einsendung",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                  );
                }
                final question = questions[questionIndex];
                var choiceTitleByValues = {for (final choice in question.choices) choice.value: choice.title, '""': '""'};

                return TableViewCell(
                  child: Center(
                    child: FilterableTableCell(
                      title: question.title,
                      id: question,
                      titleByValues: choiceTitleByValues,
                      tableVicinity: vicinity,
                    ),
                  ),
                );
              }

              final submissionIndex = vicinity.row - 1;
              var submission = filteredSubmissions[submissionIndex];

              if (vicinity.column == 0) {
                return TableViewCell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        submission.title,
                        style: TextStyle(color: textColor),
                      ),
                    ),
                  ),
                );
              }

              final question = questions[questionIndex];
              final answersByPath = submission.answersByPath;
              final topLevelPath = question.toTopLevelPath;
              final Iterable<ChoiceQuestionAnswer> answers = answersByPath[topLevelPath]?.values ?? {};

              return TableViewCell(
                child: Center(
                  child: IntrinsicTableCell(
                    survey: survey,
                    path: topLevelPath,
                    choiceQuestionAnswers: answers,
                    question: question,
                    submission: submission,
                    tableVicinity: vicinity,
                  ),
                ),
              );
            },
            columnCount: questionColumns.length,
            columnBuilder: (int column) {
              if (column == 0) {
                return TableSpan(
                  extent: FixedTableSpanExtent(250.0),
                  foregroundDecoration: TableSpanDecoration(
                    border: TableSpanBorder(
                      trailing: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: colorScheme.onBackground,
                      ),
                    ),
                  ),
                );
              }

              final questionIndex = column;
              final question = questions[questionIndex];
              var cellSizes = GetIt.I.get<CellSizesService>();

              return TableSpan(
                extent: FixedTableSpanExtent(cellSizes?.cellWidths[column] ?? 250.0),
                foregroundDecoration: TableSpanDecoration(
                  border: TableSpanBorder(
                    trailing: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: colorScheme.onBackground,
                    ),
                  ),
                ),
              );
            },
            rowCount: filteredSubmissions.length + 1,
            rowBuilder: (int row) {
              var cellSizes = GetIt.I.get<CellSizesService>();

              return TableSpan(
                extent: FixedTableSpanExtent(cellSizes?.cellHeights[row] ?? 25.0),
                backgroundDecoration: TableSpanDecoration(
                  color: row == 0
                      ? colorScheme.primary.withOpacity(0.8)
                      : row.isEven
                          ? colorScheme.secondary.withOpacity(0.6)
                          : colorScheme.background,
                ),
              );
            },
          );
        });
  }
}
