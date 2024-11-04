import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExceptionDialog extends StatelessWidget {
  const ExceptionDialog({
    super.key,
    required this.exception,
  });

  final String exception;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.errorTitle),
      content: SelectableText(exception),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('ok'),
        ),
      ],
    );
  }
}
