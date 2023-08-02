import 'package:easy_eats/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool isLoading = false;
  // final _authService = AuthService();
  final FirebaseAuth _authService = FirebaseAuth.instance;

  Future<bool> createUser(
      {required String email, required String password}) async {
    try {
      await _authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw 'The password provided is too weak.';
      } else if (e.code == "email-already-in-use") {
        throw 'An account already exists for that email.';
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signIn({required String email, required String password}) async {
    try {
      await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
