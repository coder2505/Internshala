import 'package:flutter/material.dart';
import 'package:internshala/pages_designs/loginpage_start.dart';

void main() {
  runApp(Internshala());
}

class Internshala extends StatelessWidget {
  const Internshala({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: LoginpageStart(),
    );
  }
}
