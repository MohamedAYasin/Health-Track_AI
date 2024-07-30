import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_track_ai/routes/main_router.dart';
import 'package:health_track_ai/pages/splash_screen.dart';
void main() {
  testWidgets('SplashScreen displays correctly and navigates after delay',
      (WidgetTester tester) async {
    // Build the SplashScreen widget
    await tester.pumpWidget(const MaterialApp(home: SplashScreen()));

    // Verify the splash screen's widgets
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Health Track'), findsOneWidget);
    expect(find.text('Your Health, Your Control \n Track and Thrive'),
        findsOneWidget);

    // Ensure that the navigation to MainRouter happens after the delay
    // Pumping the widget for 2 seconds
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Verify navigation to MainRouter
    expect(find.byType(MainRouter), findsOneWidget);
  });
}
