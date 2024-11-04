
import 'package:json_to_survey/submissions_detail_table.dart';

import 'package:json_to_survey/inherited_widgets.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:example_data/example_data.dart' as exampleData;
import 'package:get_it/get_it.dart';



import 'package:json_to_survey/src/store/store.dart';
import 'package:json_to_survey/store.dart';


import 'package:collection/collection.dart';
import 'package:json_to_survey/model.dart';
import 'package:json_to_survey/view_model.dart';
import 'package:flutter/widgets.dart';

void main() {
  GetIt.I.registerSingleton<ViewModel>(ViewModel());

  GetIt.I.registerSingleton<Store>(LocalStore());

  GetIt.I.registerSingleton<CellSizesService>(CellSizesService());

  GetIt.I.registerSingleton<ChoiceFilterService>(ChoiceFilterService());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Submissions Overview'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final vm = GetIt.I.get<ViewModel>();

    final Survey survey = Survey.fromJson(exampleData.survey)!;
    vm.surveyViewModel.update([survey]);

    final submissions = exampleData.submissions
        .map((submission) => Submission.fromJson(submission))
        .whereNotNull()
        .toList();

    vm.submissionViewModel.update(submissions);

    final choiceQuestionAnswers = exampleData.choiceQuestionAnswers
        .map((answer) => ChoiceQuestionAnswer.fromJson(answer))
        .whereNotNull()
        .toList();

    vm.choiceQuestionAnswerViewModel.update(choiceQuestionAnswers);

    final concretisations = exampleData.concretisations
        .map((answer) => Concretisation.fromJson(answer))
        .whereNotNull()
        .toList();
    vm.concretisationsViewModel.update(concretisations);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SelectedSurvey(selectedSurvey: survey,
        child: SubmissionTable(
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



Widget toWidget(
    {required Survey survey,
      required Submission submission,
      required SurveyEntryPath path,
      required Question question,
      required List<ChoiceQuestionAnswer> choiceQuestionAnswers}) {
  var answersByPath = GetIt.I
      .get<ViewModel>()
      .choiceQuestionAnswerViewModel
      .bySubmissionAndPath[submission];

  final Iterable<ChoiceQuestionAnswer> answersForColumn =
      answersByPath?[path]?.values ?? {};

  final questionsAndChoicesByPath = survey.questionsAndChoicesByPath;
  final questionByPath = questionsAndChoicesByPath.questionByPathMap;
  final choicesByPath = questionsAndChoicesByPath.choicesByPathMap;

  final question = questionByPath[path];

  if (question is ChoiceQuestion) {
    var choices = answersForColumn.map((answer) {
      var choice = question.choices
          .singleWhere((choice) => choice.value == answer.answer);

      return choice;
    });

    return SizedBox.shrink();
  }
  return Text(path.toString());
}



