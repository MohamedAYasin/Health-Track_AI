import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_track_ai/routes/auth_router.dart';
import 'package:health_track_ai/pages/auth_landing_page.dart';

void main() {
  testWidgets('AuthRouter should display AuthLandingPage',
      (WidgetTester tester) async {
    // Mock callback
    void mockSetAuthenticated() {}

    await tester.pumpWidget(MaterialApp(
      home: AuthRouter(setAuthenticated: mockSetAuthenticated),
    ));

    // Verify that AuthLandingPage is displayed
    expect(find.byType(AuthLandingPage), findsOneWidget);
  });
}
