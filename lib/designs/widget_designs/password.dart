import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    FocusNode node = FocusNode();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Password", style: TextStyle(fontSize: 16)),
          ),
          SizedBox(height: 8),
          TextField(
            obscureText: true,
            focusNode: node,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: "Enter password here",
              hintStyle: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
