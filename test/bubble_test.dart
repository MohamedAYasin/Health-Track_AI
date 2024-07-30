import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:health_track_ai/constant/colors.dart';
import 'package:health_track_ai/widgets/chat_bubble.dart'; // Adjust the path according to your directory structure

void main() {
  testWidgets('ChatBubble displays sender message correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ChatBubble(
            message: 'Hello from sender!',
            isSender: true,
          ),
        ),
      ),
    );

    // Verify that the message is displayed
    expect(find.text('Hello from sender!'), findsOneWidget);

    // Verify that the color is correct for sender
    final bubble =
        tester.widget<BubbleSpecialThree>(find.byType(BubbleSpecialThree));
    expect(bubble.color, CustomColors.mainBlue);
    expect(bubble.textStyle.color, CustomColors.white);
  });

  testWidgets('ChatBubble displays receiver message correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ChatBubble(
            message: 'Hello from receiver!',
            isSender: false,
          ),
        ),
      ),
    );

    // Verify that the message is displayed
    expect(find.text('Hello from receiver!'), findsOneWidget);

    // Verify that the color is correct for receiver
    final bubble =
        tester.widget<BubbleSpecialThree>(find.byType(BubbleSpecialThree));
    expect(bubble.color, Colors.grey[300]);
    expect(bubble.textStyle.color, CustomColors.black);
  });
}
