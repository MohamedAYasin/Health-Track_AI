import 'package:flutter/material.dart';
import 'package:health_track_ai/constant/colors.dart';
import 'package:health_track_ai/pages/add_record_page.dart';
import 'package:health_track_ai/widgets/record_card.dart';
import 'package:health_track_ai/models/record_model.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Records',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: CustomColors.mainBlue,
        foregroundColor: CustomColors.white,
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text('Add', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddRecordPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return RecordCard(
                record: Record(
              title: 'Record $index',
              description: 'Description of record $index',
              amount: index * 10.0,
            ));
          },
        ),
      ),
    );
  }
}
