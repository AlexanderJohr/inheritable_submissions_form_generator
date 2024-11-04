
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_to_survey/src/value_types/survey.dart';


class TextConcretisationView extends StatelessWidget {
  const TextConcretisationView(
      {super.key, 
      required this.concretisationValue,
      required this.onChanged});

  final TextConcretisation concretisationValue;

  final ValueChanged<TextConcretisation> onChanged;

 
  @override
  Widget build(BuildContext context) {
    final editingController =
        TextEditingController(text: concretisationValue.text);

    return Focus(
      child: TextFormField(
          controller: editingController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.pleaseEnterTextMessage;
            }
            return null;
          }),
      onFocusChange: (gotFocus) {
        final lostFocus = !gotFocus;
        if (lostFocus) {
          onChanged(concretisationValue
              .rebuild((b) => b.text = editingController.text));
        }
      },
    );
  }
}

