import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/dialogs/exception_dialog.dart';
import 'package:json_to_survey/src/value_types/survey.dart';

import '../store/store.dart';


class RenameSubmissionDialog extends StatelessWidget {
  const RenameSubmissionDialog({
    super.key,
    required this.submission,
  });

  final Submission submission;

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I.get<Store>();


    TextEditingController textEditingController =
        TextEditingController(text: submission.title);

    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.renameSubmissionTitle(submission.title)),
      content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.newTitleText,
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
            final navigator = Navigator.of(context);

            final dialogContext = context;

            runZonedGuarded(() async {
              store.updateSubmission(
                original: submission,
                updates:
                    submission.rebuild((b) => b.title = textEditingController.text),
              );
              navigator.pop('OK');
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
          child: Text(AppLocalizations.of(context)!.renameText),
        ),
      ],
    );
  }
}
