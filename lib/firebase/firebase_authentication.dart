import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthenticationService {
  static final FirebaseAuth firebaseAuthentication = FirebaseAuth.instance;
  static Stream<User?> get authStateChange =>
      firebaseAuthentication.authStateChanges();
  static Future<dynamic> signIn(
      String email, String password, BuildContext context) async {
    try {
      await firebaseAuthentication.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid User or Password. Please try again... $e')));
      return false;
    }
  }

  static Future<void> signOut(BuildContext context) async {
    try {
      await firebaseAuthentication.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Something went wrong. Please try it again $e")));
    }
  }

  static Future<dynamic> createAccount(
    String email,
    String password,
    String confirmPass,
    BuildContext context,
  ) async {
    try {
      if (password != confirmPass) {
        throw Exception("Password and Confirm Password must be similar!!!");
      }
      await firebaseAuthentication.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Something went wrong. Please try again $e")));
    }
  }
}
