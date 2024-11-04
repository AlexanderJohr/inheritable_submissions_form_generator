import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_to_survey/src/value_types/survey.dart';

class SurveyPath extends InheritedWidget {
  final SurveyEntryPath surveyEntryPath;

  const SurveyPath({super.key, required super.child, required this.surveyEntryPath});

  @override
  bool updateShouldNotify(covariant SurveyPath oldWidget) =>
      surveyEntryPath != oldWidget.surveyEntryPath;

  static SurveyEntryPath of(BuildContext context) {
    final SurveyPath? inheritedSurveyEntryPath =
        context.dependOnInheritedWidgetOfExactType<SurveyPath>();

    if (inheritedSurveyEntryPath == null) {
      String errorText = AppLocalizations.of(context)!.noSurveyPathInContextFoundText;
      assert(false, errorText);
      throw FlutterError(
        errorText,
      );
    }

    assert(true);
    return inheritedSurveyEntryPath.surveyEntryPath;
  }
}
