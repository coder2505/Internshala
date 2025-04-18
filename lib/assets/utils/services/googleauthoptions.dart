import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internshala/designs/pages_designs/recruitee_signup_details.dart';
import 'package:internshala/designs/pages_designs/recuitee_homepage.dart';

class GoogleAuthOptions {
  loginwithgoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final creditional = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await FirebaseAuth.instance.signInWithCredential(creditional);

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecuiterHomepage()),
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  signupwithgoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final creditional = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await FirebaseAuth.instance.signInWithCredential(creditional);

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecruiteeSignupDetails()),
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
