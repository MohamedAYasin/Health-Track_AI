import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_track_ai/widgets/message_bar.dart'; // Adjust the path as needed

void main() {
  testWidgets(
      'MessageBar should call onSend with correct message when send button is pressed',
      (WidgetTester tester) async {
    // Define a mock callback to capture the message sent
    String? sentMessage;
    void mockOnSend(String message) {
      sentMessage = message;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MessageBar(onSend: mockOnSend),
        ),
      ),
    );

    // Find the TextField and enter a message
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);
    await tester.enterText(textFieldFinder, 'Hello World!');

    // Find and press the send button
    final sendButtonFinder = find.byIcon(Icons.send);
    expect(sendButtonFinder, findsOneWidget);
    await tester.tap(sendButtonFinder);
    await tester.pump(); // Rebuild the widget tree

    // Check that the onSend callback was called with the correct message
    expect(sentMessage, 'Hello World!');
  });

  testWidgets('MessageBar should clear the text field after sending a message',
      (WidgetTester tester) async {
    // Define a mock callback
    void mockOnSend(String message) {}

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MessageBar(onSend: mockOnSend),
        ),
      ),
    );

    // Find the TextField and enter a message
    final textFieldFinder = find.byType(TextField);
    await tester.enterText(textFieldFinder, 'Hello World!');

    // Find and press the send button
    final sendButtonFinder = find.byIcon(Icons.send);
    await tester.tap(sendButtonFinder);
    await tester.pump(); // Rebuild the widget tree

    // Verify that the TextField is cleared
    final textField = tester.widget<TextField>(textFieldFinder);
    expect(textField.controller?.text, '');
  });
}
