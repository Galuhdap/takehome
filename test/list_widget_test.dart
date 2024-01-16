import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:takehomechallenge/widget/list_widget.dart';

void main() {
  testWidgets('ListBookWidget should render correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListBookWidget(
            title: 'Sample Title',
            species: 'Sample Species',
            location: 'Sample Location',
            function: () {},
            contWidget: const Text('Additional Widget'),
          ),
        ),
      ),
    );

    expect(find.text('Sample Title'), findsOneWidget);
    expect(find.text('Sample Species'), findsOneWidget);
    expect(find.text('Sample Location'), findsOneWidget);
    expect(find.text('Additional Widget'), findsOneWidget);
  });

  testWidgets('ListBookWidget should call function when tapped',
      (WidgetTester tester) async {
    bool functionCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListBookWidget(
            title: 'Sample Title',
            species: 'Sample Species',
            location: 'Sample Location',
            function: () {
              functionCalled = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Sample Title'));
    await tester.pump();

    expect(functionCalled, isTrue);
  });
}
