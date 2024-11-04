import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_to_survey/src/value_types/survey.dart';


enum DeleteInheritedAnswerOperation { delete, keep, cancel, notNecessary }

class DeleteInheritedAnswerOperationDialog extends StatelessWidget {
  const DeleteInheritedAnswerOperationDialog(
      {super.key,
      required this.answerToDelete,
      required this.inheritingSubmissionTitles});

  final Choice answerToDelete;
  final Set<String> inheritingSubmissionTitles;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Scaffold(
      appBar: AppBar(
          title: Text( AppLocalizations.of(context)!.whatShouldHappenWithInheritanceText)),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan( 
                text: AppLocalizations.of(context)!.theAnswerText,
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: answerToDelete.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: AppLocalizations.of(context)!.willBeInheritedText),
                  TextSpan(
                    text: inheritingSubmissionTitles.join(", "),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: AppLocalizations.of(context)!.whatShouldHappenText),
                ],
              )),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                    onPressed: () => Navigator.of(context)
                        .pop(DeleteInheritedAnswerOperation.delete),
                    icon: const Icon(Icons.delete),
                    label: RichText(
                        text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: AppLocalizations.of(context)!.deleteWithLineBreakText,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24)),
                        TextSpan(text: AppLocalizations.of(context)!.inText),
                        TextSpan(
                          text: inheritingSubmissionTitles.join(", "),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        TextSpan(text: AppLocalizations.of(context)!.theAnswerWithLineBreaksText),
                        TextSpan(
                          text: answerToDelete.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: AppLocalizations.of(context)!.deleteWithSpaceText),
                      ],
                    )))),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white),
                    onPressed: () => Navigator.of(context)
                        .pop(DeleteInheritedAnswerOperation.keep),
                    icon: const Icon(Icons.lock),
                    label: RichText(
                        softWrap: true,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: AppLocalizations.of(context)!.keepAnswerText,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24)),
                            TextSpan(text: AppLocalizations.of(context)!.inText),
                            TextSpan(
                              text: inheritingSubmissionTitles.join(", "),
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(text: AppLocalizations.of(context)!.theAnswerWithLineBreaksText),
                            TextSpan(
                              text: answerToDelete.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                                text: AppLocalizations.of(context)!.indicateThatInheritanceIsNotValidText),
                          ],
                        )))),
             
           
          ],
        ),
      ),
      persistentFooterButtons: [
        FloatingActionButton.extended(
            onPressed: () => Navigator.of(context)
                .pop(DeleteInheritedAnswerOperation.cancel),
            backgroundColor: Colors.red,
            icon: const Icon(Icons.cancel_outlined),
            label: Text(AppLocalizations.of(context)!.abortText))
      ],
    ));
  }
}
