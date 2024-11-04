
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_to_survey/src/value_types/survey.dart';

class SelectedSubmission extends InheritedWidget {
  final Submission selectedSubmission;

  const SelectedSubmission({super.key, required super.child, required this.selectedSubmission});

  @override
  bool updateShouldNotify(covariant SelectedSubmission oldWidget) =>
      selectedSubmission != oldWidget.selectedSubmission;

  static Submission of(BuildContext context) {
    final SelectedSubmission? inheritedSelectedSubmission =
        context.dependOnInheritedWidgetOfExactType<SelectedSubmission>();

    if (inheritedSelectedSubmission == null) {
      String errorText = AppLocalizations.of(context)!.noSelectedSubmissionInContextFoundText;
      assert(false, errorText);
      throw FlutterError(
        errorText,
      );
    }

    assert(true);
    return inheritedSelectedSubmission.selectedSubmission;
  }
}
