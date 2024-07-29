import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseApp extends Mock implements FirebaseApp {}

Future<void> setupFirebaseMocks() async {
  Firebase.initializeApp();
  // You may need to set up additional mocks depending on your usage.
}
