import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_submission.dart';
import 'package:json_to_survey/src/value_types/submission_extensions.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:json_to_survey/src/widgets/choice_question_card.dart';
import 'package:json_to_survey/src/widgets/choice_question_page_history.dart';
import 'package:rxdart/rxdart.dart';

import '../view_model/view_models.dart';
import 'choice_list_tile.dart';
import 'choice_question_list_view.dart';

class ChoiceQuestionPage extends Page {
  final SurveyEntryPath path;
  final ChoiceQuestion question;
  final OnUpdateChoiceQuestionAnswer onUpdateChoiceQuestionAnswer;
  final ViewModel vm;

  const ChoiceQuestionPage(
      {required this.question,
      required this.path,
      required this.onUpdateChoiceQuestionAnswer,
      required this.vm});

  @override
  Route createRoute(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    Future<bool> goBackOnValidInput() {
      if (formKey.currentState!.validate()) {
        return Future.value(true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(AppLocalizations.of(context)!.errInFormText)));
        return Future.value(false);
      }
    }

    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final submission = SelectedSubmission.of(context);

        final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
        final curveTween = CurveTween(curve: Curves.easeInOut);
        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: Scaffold(
            appBar: AppBar(
              title: Text(question.title),
            ),
            body: ChoiceQuestionPageHistory(
              alwaysReplaceHistory: false,
              child: WillPopScope(
                  onWillPop: goBackOnValidInput,
                  child: Form(
                    key: formKey,
                    child: ChoiceQuestionListView(
                        submission: submission,
                        question: question,
                        path: path,
                        onUpdateChoiceQuestionAnswer:
                            onUpdateChoiceQuestionAnswer,
                    vm: vm),
                  )),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  Navigator.of(context).maybePop();
                },
                tooltip: setConfirmToolTip(context),
                child: const Icon(Icons.check)),
          ),
        );
      },
    );
  }
}
