import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';
import 'package:health_track_ai/models/record_model.dart';

// Create a Mock class for DocumentSnapshot
// ignore: subtype_of_sealed_class
class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  group('Record class', () {
    test('should create Record from Firestore data', () {
      // Arrange
      final Map<String, dynamic> firestoreData = {
        'leadingCause': 'Heart Disease',
        'description': 'A description of the cause',
        'mood': 'Happy',
        'started': '2024-01-01',
        'symptom': 'Chest Pain',
        'title': 'Heart Disease Record',
        'userId': 'user123',
      };

      final mockDoc = MockDocumentSnapshot();
      when(mockDoc.data()).thenReturn(firestoreData);

      // Act
      final record = Record.fromFirestore(mockDoc);

      // Assert
      expect(record.leadingCause, 'Heart Disease');
      expect(record.description, 'A description of the cause');
      expect(record.mood, 'Happy');
      expect(record.started, '2024-01-01');
      expect(record.symptom, 'Chest Pain');
      expect(record.title, 'Heart Disease Record');
      expect(record.userId, 'user123');
    });

    test('should use default values when fields are missing', () {
      // Arrange
      final Map<String, dynamic> firestoreData = {};

      final mockDoc = MockDocumentSnapshot();
      when(mockDoc.data()).thenReturn(firestoreData);

      // Act
      final record = Record.fromFirestore(mockDoc);

      // Assert
      expect(record.leadingCause, '');
      expect(record.description, '');
      expect(record.mood, '');
      expect(record.started, '');
      expect(record.symptom, '');
      expect(record.title, '');
      expect(record.userId, '');
    });
  });
}
