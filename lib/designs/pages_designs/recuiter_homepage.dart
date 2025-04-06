import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internshala/designs/widget_designs/recuiter_bottomnavbar.dart';

class RecuiterHomepage extends StatefulWidget {
  const RecuiterHomepage({super.key});

  @override
  State<RecuiterHomepage> createState() => _RecuiterHomepageState();
}

class _RecuiterHomepageState extends State<RecuiterHomepage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'lib/assets/images/internshalaLogo.png',
              width: width * 0.5,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),

      body: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text("LOGOUT"),
          ),
        ),

        bottomNavigationBar: RecuiterBottomnavbar().bottombar(),
      ),
    );
  }
}
