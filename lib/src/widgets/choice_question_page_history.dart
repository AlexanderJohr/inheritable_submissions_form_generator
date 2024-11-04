import 'package:flutter/material.dart';

class ChoiceQuestionPageHistory extends InheritedWidget {
  const ChoiceQuestionPageHistory({
    Key? key,
    required this.alwaysReplaceHistory,
    required Widget child,
  }) : super(key: key, child: child);

  final bool alwaysReplaceHistory;
  static ChoiceQuestionPageHistory of(BuildContext context) {
    final ChoiceQuestionPageHistory? result =
        context.dependOnInheritedWidgetOfExactType<ChoiceQuestionPageHistory>();
    assert(result != null,
        "Keine MultipleChoiceSelectionPageHistory im 'context' gefunden");
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
