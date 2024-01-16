import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:takehomechallenge/widget/search_widget.dart';

void main() {
  testWidgets('SearchWidget calls onChange callback',
      (WidgetTester tester) async {
    String? searchText;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchWidget(
            onChange: (text) {
              searchText = text;
            },
          ),
        ),
      ),
    );

    final Finder textFieldFinder = find.byType(TextField);

    await tester.enterText(textFieldFinder, 'Sample Search Text');

    expect(searchText, 'Sample Search Text');
  });
}
