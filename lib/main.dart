import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health_track_ai/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const HealthTrackAIApp());
}

class HealthTrackAIApp extends StatelessWidget {
  const HealthTrackAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health-Track AI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
