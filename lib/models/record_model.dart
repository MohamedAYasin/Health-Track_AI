import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String cause;
  final String description;
  final String mood;
  final String started;
  final String symptom;
  final String title;

  Record({
    required this.cause,
    required this.description,
    required this.mood,
    required this.started,
    required this.symptom,
    required this.title,
  });

  factory Record.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Record(
      cause: data['cause'] ?? '',
      description: data['description'] ?? '',
      mood: data['mood'] ?? '',
      started: data['started'] ?? '',
      symptom: data['symptom'] ?? '',
      title: data['title'] ?? '',
    );
  }
}
