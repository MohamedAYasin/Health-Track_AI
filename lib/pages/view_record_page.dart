import 'package:flutter/material.dart';
import 'package:health_track_ai/models/record_model.dart';

class ViewRecordPage extends StatelessWidget {
  final Record record;

  const ViewRecordPage({required this.record, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(record.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(record.description),
            Text(record.amount.toString()),
          ],
        ),
      ),
    );
  }
}
