import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/dialogs/exception_dialog.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_survey.dart';
import 'package:json_to_survey/src/settings_view_button.dart';

import '../store/store.dart';
import '../widgets/app_state.dart';

class AddSubmissionPage extends Page {
  const AddSubmissionPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        return AddSubmissionView();
      },
    );
  }
}

class AddSubmissionView extends StatelessWidget {
  AddSubmissionView({super.key});

  static const routeName = '/add-survey';

  final TextEditingController submissionTitleController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
     final store = GetIt.I.get<Store>();
    final selectedSurveyType = SelectedSurvey.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addSubmissionTitle),
        actions: const [SettingsViewButton()],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[

              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: submissionTitleController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.submissionTitleLabel,
                  ),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: Text(AppLocalizations.of(context)!.addButtonText),
                    onPressed: () async {
                      final navigator = Navigator.of(context);

                      final dialogContext = context;

                      runZonedGuarded(() async {
                        final addedSubmission = await store.addSubmission(
                            survey: selectedSurveyType,
                            submissionTitle: submissionTitleController.text,
                            createdBy: store.username);

                        if (addedSubmission.title == submissionTitleController.text &&
                            addedSubmission.surveyId == selectedSurveyType.id) {
                          navigator.pop();
                        }
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
                  )),
            ],
          )),
    );
  }
}
