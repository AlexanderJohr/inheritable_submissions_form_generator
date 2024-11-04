import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.title,
    required this.acceptTitle,
    this.cancelTitle,
    this.contentText,
  });

  final String title;
  final String? contentText;
  final String acceptTitle;
  final String? cancelTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(contentText ?? title),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop<bool>(context, true),
          child: Text(acceptTitle),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop<bool>(context, false),
          child: Text(cancelTitle ?? AppLocalizations.of(context)!.abortText),
        ),
      ],
    );
  }
}
