// ignore_for_file: use_build_context_synchronously

import 'package:easy_eats/service/auth_service.dart';
import 'package:easy_eats/view/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool isLoading = false;
  final _authService = AuthService();

  Future<void> createUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _navigation(context: context);
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

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _navigation(context: context);
    } catch (e) {
      rethrow;
    }
  }

  void _navigation({required BuildContext context}) async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomePage(),
      ),
    );
  }
}
