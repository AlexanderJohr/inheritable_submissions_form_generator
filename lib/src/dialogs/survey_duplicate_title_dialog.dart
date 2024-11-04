import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/dialogs/exception_dialog.dart';
import 'package:json_to_survey/src/value_types/survey.dart';

import '../store/store.dart';


class SubmissionDuplicateTitleDialog extends StatelessWidget {
  const SubmissionDuplicateTitleDialog({
    super.key,
    required this.submission,
  });

  final Submission submission;

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I.get<Store>();


    TextEditingController duplicateTitleTextEditingController =
        TextEditingController(text: AppLocalizations.of(context)!.copyOfSubmissionTitle(submission.title));

    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.duplicateSubmissionTitle(submission.title)),
      content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: duplicateTitleTextEditingController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.submissionTitleForDuplicateText,
                  ),
                ),
              ),
            ],
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text(AppLocalizations.of(context)!.abortText),
        ),
        TextButton(
          onPressed: () {
            final dialogContext = context;


            runZonedGuarded(() async {
              store.duplicateSubmission(
                  submissionToDuplicate: submission,
                  submissionTitle: duplicateTitleTextEditingController.text,
                  createdBy: store.username);
              Navigator.pop(context, 'OK');
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
          child: Text(AppLocalizations.of(context)!.duplicateText),
        ),
      ],
    );
  }
}
