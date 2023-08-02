import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw 'The password provided is too weak.';
      } else if (e.code == "email-already-in-use") {
        throw 'An account already exists for that email.';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        //TODO: rever erros
        throw 'The password provided is too weak.';
      } else if (e.code == "email-already-in-use") {
        throw 'An account already exists for that email.';
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
