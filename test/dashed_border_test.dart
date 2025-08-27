import 'package:dashed_border/dashed_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DashedBorder renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              border: DashedBorder(
                color: Colors.blue,
                width: 2,
                dashLength: 6,
                dashGap: 3,
              ),
            ),
            width: 100,
            height: 50,
          ),
        ),
      ),
    );

    // Find the container
    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    // Pump a frame to trigger paint
    await tester.pump();

    // We can't "read" pixels easily, but this ensures no exceptions are thrown
    expect(tester.takeException(), isNull);
  });
}
