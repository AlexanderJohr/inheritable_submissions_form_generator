
import 'package:json_to_survey/src/value_types/survey.dart';

extension DisableableExtensions on Disableable {
  bool isEnabled(GetFieldValues getFieldValuesDelegate) =>
      enabledIf?.check(getFieldValuesDelegate) != false;

  bool isDisabled(GetFieldValues getFieldValuesDelegate) =>
      !isEnabled(getFieldValuesDelegate);
}
