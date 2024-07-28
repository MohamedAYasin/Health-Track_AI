import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../services/google_sign_in_service.dart';


class UserController {
  final AuthRepository _authRepository;
  final GoogleSignInService _googleSignInService;

  UserController(this._authRepository, this._googleSignInService);

  Future<UserCredential?> loginWithEmail(String email, String password) async {
    return await _authRepository.signInWithEmail(email, password);
  }

  Future<UserCredential?> loginWithGoogle() async {
    return await _googleSignInService.signInWithGoogle();
  }
}


class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithEmail(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.message ?? e.code);
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.message ?? e.code);
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.message ?? e.code);
    } catch (e) {
      if (kDebugMode) print('Something went wrong, Champ: $e');
      return null;
    }
  }
}

class MFirebaseAuthException implements Exception {
  final String message;
  MFirebaseAuthException(this.message);
}

class MFirebaseException implements Exception {
  final String message;
  MFirebaseException(this.message);
}

class MFormatException implements Exception {
  const MFormatException();
}

class MPlatformException implements Exception {
  final String message;
  MPlatformException(this.message);
}