import 'package:flutter/material.dart';
import 'package:health_track_ai/constant/colors.dart';
import 'package:health_track_ai/pages/add_record_page.dart';
import 'package:health_track_ai/widgets/record_card.dart';
import 'package:health_track_ai/models/record_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({super.key});

  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  final List<Record> _records = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchRecordsFromFirestore();
  }

  Future<void> _fetchRecordsFromFirestore() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('records')
            .where('userId', isEqualTo: user.uid) // Filter records by user_id
            .get();

        final List<Record> loadedRecords =
            snapshot.docs.map((doc) => Record.fromFirestore(doc)).toList();

        setState(() {
          _records.addAll(loadedRecords);
          _isLoading = false;
          if (_records.isEmpty) {
            _errorMessage = 'No records found for your account.';
          }
        });
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = 'User not logged in.';
        });
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error fetching records: $error';
      });
    }
  }

  void _addNewRecord(Record record) {
    setState(() {
      _records.add(record);
      _errorMessage = null; // Clear error message if new records are added
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
      if (_records.isEmpty) {
        _errorMessage = 'No records found for your account.';
      }
    });
  }

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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: _errorMessage != null
                  ? Center(child: Text(_errorMessage!))
                  : ListView.builder(
                      itemCount: _records.length,
                      itemBuilder: (context, index) {
                        return RecordCard(
                          record: _records[index],
                          onEdit: () async {
                            final updatedRecord = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddRecordPage(record: _records[index]),
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
