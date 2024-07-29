import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_track_ai/pages/home_page.dart';
import 'package:health_track_ai/pages/records_page.dart';
import 'package:health_track_ai/pages/chat_bot_page.dart';
import 'package:health_track_ai/pages/profile_page.dart';
import 'package:health_track_ai/routes/logged_router.dart';

void main() {
  testWidgets(
      'LoggedRouter should display the correct page based on selected index',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoggedRouter()));

    // Verify initial screen
    expect(find.byType(HomePage), findsOneWidget);

    // Tap on the Records tab
    await tester.tap(find.text('Records'));
    await tester.pumpAndSettle();
    expect(find.byType(RecordsPage), findsOneWidget);

    // Tap on the Chat Bot tab
    await tester.tap(find.text('Chat Bot'));
    await tester.pumpAndSettle();
    expect(find.byType(ChatBotPage), findsOneWidget);

    // Tap on the Profile tab
    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();
    expect(find.byType(ProfilePage), findsOneWidget);
  });
}
