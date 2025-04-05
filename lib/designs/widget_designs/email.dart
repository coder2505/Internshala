import 'package:flutter/material.dart';
import 'package:internshala/global_variables.dart';

class Email extends StatefulWidget {
  const Email({super.key});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  FocusNode node = FocusNode();
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Email", style: TextStyle(fontSize: 16)),
          ),
          SizedBox(height: 8),
          TextField(
            focusNode: node,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: "Enter email here",
              hintStyle: TextStyle(fontSize: 16),
            ),
            onChanged: (email) {
              GlobalVariables().emailBox = email.trim();
            },
          ),
          // TextField(controller: textEditingController),
        ],
      ),
    );
  }
}
