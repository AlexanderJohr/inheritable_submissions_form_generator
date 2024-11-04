import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:json_to_survey/src/widgets/concretisations/german_decimal_input_formatter.dart';


class DecimalConcretisationView extends StatelessWidget {
  const DecimalConcretisationView(
      {super.key, required this.concretisation, required this.onChanged});

  final DecimalConcretisation concretisation;

  final ValueChanged<DecimalConcretisation> onChanged;

  @override
  Widget build(BuildContext context) {
    final editingController =
        TextEditingController(text: concretisation.decimal);

    return Focus(
        child: TextFormField(
            controller: editingController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: germanDecimalInputFormatter,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.validatorText;
              }
              return null;
            }),
        onFocusChange: (gotFocus) {
          final lostFocus = !gotFocus;

          if (lostFocus) {
            onChanged(concretisation
                .rebuild((b) => b..decimal = editingController.text));
          }
        });
  }
}

