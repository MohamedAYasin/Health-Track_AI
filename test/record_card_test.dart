import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_track_ai/models/record_model.dart';
import 'package:health_track_ai/pages/view_record_page.dart';
import 'package:health_track_ai/widgets/record_card.dart'; // Adjust the path as needed

void main() {
  testWidgets('RecordCard should display record information correctly',
      (WidgetTester tester) async {
    final record = Record(
      title: 'Test Title',
      leadingCause: 'Test Cause',
      description: 'Test Description',
      mood: 'Happy',
      started: '2024-01-01',
      symptom: 'None',
      userId: 'testId',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RecordCard(
            record: record,
            onEdit: () {},
            onDelete: () {},
          ),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Cause: Test Cause'), findsOneWidget);
    expect(find.text('Description: Test Description'), findsOneWidget);
    expect(find.text('Mood: Happy'), findsOneWidget);
    expect(find.text('Started: 2024-01-01'), findsOneWidget);
    expect(find.text('Symptom: None'), findsOneWidget);
  });

  testWidgets('RecordCard should navigate to ViewRecordPage when tapped',
      (WidgetTester tester) async {
    final record = Record(
      title: 'Test Title',
      leadingCause: 'Test Cause',
      description: 'Test Description',
      mood: 'Happy',
      started: '2024-01-01',
      symptom: 'None',
      userId: 'testId',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RecordCard(
            record: record,
            onEdit: () {},
            onDelete: () {},
          ),
        ),
        routes: {
          '/view_record': (context) => ViewRecordPage(record: record),
        },
      ),
    );

    // Tap on the card to navigate
    await tester.tap(find.byType(RecordCard));
    await tester.pumpAndSettle();

    // Verify navigation to ViewRecordPage
    expect(find.byType(ViewRecordPage), findsOneWidget);
  });

  testWidgets(
      'RecordCard should call onEdit and onDelete callbacks when respective buttons are pressed',
      (WidgetTester tester) async {
    bool editCalled = false;
    bool deleteCalled = false;

    final record = Record(
      title: 'Test Title',
      leadingCause: 'Test Cause',
      description: 'Test Description',
      mood: 'Happy',
      started: '2024-01-01',
      symptom: 'None',
      userId: 'testId',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RecordCard(
            record: record,
            onEdit: () {
              editCalled = true;
            },
            onDelete: () {
              deleteCalled = true;
            },
          ),
        ),
      ),
    );

    // Tap the edit button
    await tester.tap(find.byIcon(Icons.edit));
    await tester.pump();

    // Verify the edit callback was called
    expect(editCalled, true);

    // Tap the delete button
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    // Verify the delete callback was called
    expect(deleteCalled, true);
  });
}
