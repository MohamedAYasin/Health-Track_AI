import 'package:flutter_test/flutter_test.dart';
import 'package:health_track_ai/models/message_model.dart';

void main() {
  group('Message class', () {
    test('should initialize correctly', () {
      // Arrange
      const String testMessage = 'Hello, World!';
      const bool testIsSender = true;

      // Act
      final message = Message(message: testMessage, isSender: testIsSender);

      // Assert
      expect(message.message, equals(testMessage));
      expect(message.isSender, equals(testIsSender));
    });

    test('should have correct properties', () {
      // Arrange
      const String testMessage = 'Test Message';
      const bool testIsSender = false;

      // Act
      final message = Message(message: testMessage, isSender: testIsSender);

      // Assert
      expect(message.message, isA<String>());
      expect(message.isSender, isA<bool>());
      expect(message.message, 'Test Message');
      expect(message.isSender, isFalse);
    });
  });
}
