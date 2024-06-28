import 'package:flutter/material.dart';
import 'package:health_track_ai/models/record_model.dart';
import 'package:health_track_ai/pages/view_record_page.dart';

class RecordCard extends StatelessWidget {
  final Record record;

  const RecordCard({required this.record, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(record.title),
        subtitle: Text(record.description),
        trailing: Text(record.amount.toString()),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewRecordPage(record: record)));
        },
      ),
    );
  }
}
