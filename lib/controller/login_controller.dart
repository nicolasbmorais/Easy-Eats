import 'package:easy_eats/services/firebase_service.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  LoginController({required this.auth});

  final Auth auth;
  final String email = '';
  final String password = '';
  bool isLoading = false;

  Future<void> createUser(String email, String password) async {
    try {
      isLoading = true;
      await auth.registerUserWithEmailAndPassword(email, password);
      isLoading = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      isLoading = true;
      await auth.signInUserWithEmailAndPassword(email, password);
      isLoading = false;
    } catch (e) {
      print(e);
    }
  }
}
