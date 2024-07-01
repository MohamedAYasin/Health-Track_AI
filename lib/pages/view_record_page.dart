import 'package:flutter/material.dart';
import 'package:health_track_ai/models/record_model.dart';

class ViewRecordPage extends StatelessWidget {
  final Record record;

  const ViewRecordPage({required this.record, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(record.symptom),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Symptom: ${record.symptom}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('Started: ${record.started}'),
            const SizedBox(height: 16),
            Text('Description: ${record.description}'),
            const SizedBox(height: 16),
            Text('Leading Cause: ${record.leadingCause}'),
            const SizedBox(height: 16),
            Text('Mood: ${record.mood}'),
          ],
        ),
      ),
    );
  }
}
