import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internshala/designs/pages_designs/recruitee_signup_details.dart';
import 'package:internshala/designs/pages_designs/recuitee_homepage.dart';
import 'package:internshala/global_variables.dart';

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
        GlobalVariables().emailBox = "";
        GlobalVariables().passwordBox = "";
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RecruiteeSignupDetails()),
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RecuiterHomepage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) createSnackbar(e.code, e.message, context);
    }
  }

  Future<void> createUserDocument(
    String firstName,
    String lastName,
    String contactNumber,
    String currentCity,
    String gender,
    List<String> lang,
    String type,
    BuildContext context,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection("RecruiteeData")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
            "email": FirebaseAuth.instance.currentUser?.email,
            "firstName": firstName,
            "lastName": lastName,
            "contactNumber": contactNumber,
            "city": currentCity,
            "gender": gender,
            "languages": lang,
            "type": type,
          });

      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RecuiterHomepage()),
        );
      }
    } catch (e) {
      rethrow;
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
