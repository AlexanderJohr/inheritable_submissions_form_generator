// This is an example Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//
// Visit https://flutter.dev/docs/cookbook/testing/widget/introduction for
// more information about Widget testing.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_to_survey/json_table_widget.dart';

void main() {
  group('MyWidget', () {
    testWidgets('should display a string of text', (WidgetTester tester) async {
      // Define a Widget
      const myWidget = MaterialApp(
        home: Scaffold(
          body: Text('Hello'),
        ),
      );

      // Build myWidget and trigger a frame.
      await tester.pumpWidget(myWidget);

      // Verify myWidget shows some text
      expect(find.byType(Text), findsOneWidget);
    });
  });

  testWidgets('JSON Table Widget Test', (WidgetTester tester) async {
    final myWidget = MaterialApp(
      home: Scaffold(
        body: JsonTableWidget(),
      ),
    );

    await tester.pumpWidget(myWidget);

    // Füge eine Pause hinzu, damit du das Widget betrachten kannst
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Überprüfen, ob das JsonTableWidget geladen wird
    expect(find.byType(JsonTableWidget), findsOneWidget);

    // Überprüfen, ob das erste Level der Tabelle korrekt geladen wird
    expect(find.text('type'), findsOneWidget);
    expect(find.text('Survey'), findsOneWidget);

    // Überprüfen, ob ein Unterknoten korrekt geladen wird
    expect(find.text('questions[0]/type'), findsOneWidget);
    expect(find.text('MultipleChoiceQuestion'), findsOneWidget);
  });
}
