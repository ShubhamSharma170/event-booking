// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _loding = false;

  bool get loding => _loding;

  void _setloading(bool value) {
    _loding = value;
    notifyListeners();
  }

  // method for sign up
  Future<bool> signUp(
    String email,
    String password,
    BuildContext context,
  ) async {
    _setloading(true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        log("User created: ${userCredential.user!.uid}");
        return true;
      } else {
        return false;
      }
    } on FirebaseException catch (e) {
      log("${e.message}");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("${e.message}")));
      return false;
    } finally {
      _setloading(false);
    }
  }

  // method for logIn
  Future<bool> logIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    _setloading(true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        log("User logged in: ${userCredential.user!.uid}");
        return true;
      } else {
        return false;
      }
    } on FirebaseException catch (e) {
      log("${e.message}");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("${e.message}")));
      return false;
    } finally {
      _setloading(false);
    }
  }

  // method for logOut
  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("User logged out")));
    notifyListeners();
  }
}
