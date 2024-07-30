import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_track_ai/pages/chat_bot_page.dart';
import 'package:health_track_ai/widgets/chat_bubble.dart';
import 'package:health_track_ai/widgets/message_bar.dart';

void main() {
  testWidgets('ChatBotPage renders correctly', (WidgetTester tester) async {
    // Build the ChatBotPage widget
    await tester.pumpWidget(const MaterialApp(home: ChatBotPage()));

    // Check if AppBar is present with the correct title
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Chat Bot'), findsOneWidget);

    // Check if ListView is present
    expect(find.byType(ListView), findsOneWidget);

    // Check if bottom navigation bar is present
    expect(find.byType(MessageBar), findsOneWidget);

    // Optionally, check if certain widgets within the ListView are present
    // You might need to adjust these checks depending on your actual implementation
    expect(find.byType(ChatBubble),
        findsNothing); // Initially, no messages should be present
  });
}
