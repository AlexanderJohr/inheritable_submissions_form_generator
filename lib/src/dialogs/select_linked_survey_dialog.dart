import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/view_model/view_models.dart';
import 'package:json_to_survey/src/submission_overview/submission_overview_view.dart';
import 'package:json_to_survey/src/widgets/app_state.dart';

class SelectLinkedSubmissionDialog extends StatelessWidget {
  const SelectLinkedSubmissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: StreamBuilder(
          stream: GetIt.I.get<ViewModel>().submissionLinkViewModel.changed,
          builder: (context, snapshot) {
            return SubmissionOverviewView(
                onSelectSubmission: (selectedSubmission) {
              Navigator.of(context).pop(selectedSubmission);
            });
          }),
    );
  }
}
