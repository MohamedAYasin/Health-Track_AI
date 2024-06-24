import 'package:flutter/material.dart';
import 'package:health_track_ai/routes/main_router.dart';

void main() {
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
      home: const MainRouter(),
    );
  }
}


