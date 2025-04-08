import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internshala/designs/pages_designs/recuitee_homepage.dart';

class Firebasefunctions {
  Future<void> createuserwithemailandpassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (context.mounted) {
        Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) => RecuiterHomepage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) createSnackbar(e.code, e.message, context);
    }
  }

  Future<void> loginuserwithemailandpassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) {
        Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) => RecuiterHomepage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) createSnackbar(e.code, e.message, context);
    }
  }

  void createSnackbar(String title, String? message, BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar() // Dismiss any existing snackbar
      ..showSnackBar(
        SnackBar(
          content: Column(
            children: [
              Align(
                // alignment: Alignment.centerLeft,
                child: Text(
                  title.toUpperCase(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Text(message ?? ""),
            ],
          ),
          backgroundColor: Colors.white70,
          duration: Duration(seconds: 2),
        ),
      );
  }
}
