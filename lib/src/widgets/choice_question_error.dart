import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/inherited_widgets/inherited_path.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_submission.dart';
import 'package:json_to_survey/src/validation_error_message.dart';

import 'package:json_to_survey/src/value_types/survey.dart';

import '../store/store.dart';


class ChoiceQuestionError extends StatelessWidget {
  const ChoiceQuestionError({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I.get<Store>();

    final submission = SelectedSubmission.of(context);
    final path = SurveyPath.of(context);

    final errorChanged = store.errorBySubmissionAndPathBehaviour
        .map((errorBySurveyAndPath) => errorBySurveyAndPath[submission]?.errorsByPath[path])
        .distinct();

    return StreamBuilder(
      stream: errorChanged,
      builder: (context, snapshot) {
        final errors = store.errorBySubmissionAndPath[submission]?.errorsByPath[path] ?? BuiltSet<QuestionError>({});

        return Column(
          children: errors.map((error) => error.errorMessage).toList(),
        );
      },
    );
  }
}
