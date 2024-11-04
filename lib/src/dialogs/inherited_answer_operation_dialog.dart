import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_to_survey/src/value_types/survey.dart';

enum ChangeInheritedAnswerOperation { move, delete, keep, cancel, notNecessary }

class InheritedAnswerOperationDialog extends StatelessWidget {
  const InheritedAnswerOperationDialog(
      {super.key,
      required this.answerToReplace,
      required this.answerToReplaceWith,
      required this.inheritingSubmissionTitles});

  final Choice answerToReplace;
  final Choice answerToReplaceWith;
  final Set<String> inheritingSubmissionTitles;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.whatShouldHappenWithInheritanceText)),
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
                    text: answerToReplace.title,
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
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    onPressed: () => Navigator.of(context)
                        .pop(ChangeInheritedAnswerOperation.move),
                    icon: const Icon(Icons.move_down),
                    label: RichText(
                        text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: AppLocalizations.of(context)!.sameChangeInChildrenText,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24)),
                        TextSpan(text: AppLocalizations.of(context)!.inText),
                        TextSpan(
                          text: inheritingSubmissionTitles.join(", "),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        TextSpan(text: AppLocalizations.of(context)!.alsoText),
                        TextSpan(
                          text: answerToReplace.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: AppLocalizations.of(context)!.withText),
                        TextSpan(
                          text: answerToReplaceWith.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: AppLocalizations.of(context)!.replaceText),
                      ],
                    )))),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                    onPressed: () => Navigator.of(context)
                        .pop(ChangeInheritedAnswerOperation.delete),
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
                          text: answerToReplace.title,
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
                        .pop(ChangeInheritedAnswerOperation.keep),
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
                              text: answerToReplace.title,
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
                .pop(ChangeInheritedAnswerOperation.cancel),
            backgroundColor: Colors.red,
            icon: const Icon(Icons.cancel_outlined),
            label: Text(AppLocalizations.of(context)!.abortText))
      ],
    ));
  }
}
