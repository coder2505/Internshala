// GOOGLE LOGIN BUTTON DESIGN.

import 'package:flutter/material.dart';

class Googlebutton extends StatelessWidget {
  const Googlebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.red,
        width: 150,
        height: 75,
        child: Row(children: [Text("Google")]),
      ),
    );
  }
}
