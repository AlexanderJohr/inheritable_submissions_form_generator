import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/validation_error_message.dart';

import 'package:json_to_survey/src/value_types/survey.dart';

import '../store/store.dart';


class SubmissionError extends StatelessWidget {
  const SubmissionError({super.key, required this.submission});

  final Submission submission;

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I.get<Store>();


    final errorsChanged = store.errorBySubmissionAndPathBehaviour
        .map((errorBySubmissionAndPath) => errorBySubmissionAndPath[submission])
        .distinct();

    return StreamBuilder(
      stream: errorsChanged,
      builder: (context, snapshot) {
        final errorsForSubmission = store.errorBySubmissionAndPath[submission] ??
            ChoiceAnswerValidationResult();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final errors in errorsForSubmission.errorsByPath.values.toSet())
              
              ...errors.map((error) {
                return error.errorMessage;
              }),
          ],
        );
      },
    );
  }
}
