import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

// Mock class for FirebaseAuth
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// Mock class for User
class MockUser extends Mock implements User {
  @override
  String get uid => super.noSuchMethod(
        Invocation.getter(#uid),
        returnValue: 'test_uid',
      );
}
