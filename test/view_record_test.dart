import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_track_ai/pages/view_record_page.dart';
import 'package:health_track_ai/models/record_model.dart';

// Mock record data
final mockRecord = Record(
  symptom: 'Headache',
  started: '2024-07-28',
  description: 'A severe headache that lasts all day.',
  leadingCause: 'Stress',
  mood: 'Tired',
  userId: 'test_user_id',
  title: 'Test Record',
);

void main() {
  testWidgets('ViewRecordPage displays record information correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ViewRecordPage(record: mockRecord),
      ),
    );

    // Verify the AppBar title
    expect(find.text(mockRecord.symptom), findsOneWidget);
  });
}
