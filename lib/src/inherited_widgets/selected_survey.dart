import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_to_survey/src/value_types/survey.dart';

class SelectedSurvey extends InheritedWidget {
  final Survey selectedSurvey;

  const SelectedSurvey({super.key, required super.child, required this.selectedSurvey});

  @override
  bool updateShouldNotify(covariant SelectedSurvey oldWidget) =>
      selectedSurvey != oldWidget.selectedSurvey;

  static Survey of(BuildContext context) {
    final SelectedSurvey? inheritedSelectedSurveyType =
        context.dependOnInheritedWidgetOfExactType<SelectedSurvey>();

    if (inheritedSelectedSurveyType == null) {
      String errorText = AppLocalizations.of(context)!.noSelectedSurveyTypeInContextFoundText;
      assert(false, errorText);
      throw FlutterError(
        errorText,
      );
    }

    assert(true);
    return inheritedSelectedSurveyType.selectedSurvey;
  }
}
