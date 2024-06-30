import 'package:flutter/material.dart';
import 'package:health_track_ai/constant/colors.dart';
import 'package:health_track_ai/pages/add_record_page.dart';
import 'package:health_track_ai/widgets/record_card.dart';
import 'package:health_track_ai/models/record_model.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({super.key});

  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  final List<Record> _records = [];

  void _addNewRecord(Record record) {
    setState(() {
      _records.add(record);
    });
  }

  void _editRecord(int index, Record updatedRecord) {
    setState(() {
      _records[index] = updatedRecord;
    });
  }

  void _deleteRecord(int index) {
    setState(() {
      _records.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Records', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: CustomColors.mainBlue,
        foregroundColor: CustomColors.white,
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text('Add', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              final newRecord = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddRecordPage()),
              );
              if (newRecord != null) {
                _addNewRecord(newRecord);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _records.length,
          itemBuilder: (context, index) {
            return RecordCard(
              record: _records[index],
              onEdit: () async {
                final updatedRecord = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddRecordPage(record: _records[index]),
                  ),
                );
                if (updatedRecord != null) {
                  _editRecord(index, updatedRecord);
                }
              },
              onDelete: () {
                _deleteRecord(index);
              },
            );
          },
        ),
      ),
    );
  }
}
