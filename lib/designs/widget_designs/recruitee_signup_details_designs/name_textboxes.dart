import 'package:flutter/material.dart';
import 'package:internshala/global_variables.dart';

class NameTextboxes {
  Widget design(double width, double height) {
    return SizedBox(
      width: width,
      // ROW FOR NAME - FIRST NAME AND LAST NAME
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 32, 8, 8),
            child: SizedBox(
              width: width / 2 - 16,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "First Name",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    onChanged: (text) => GlobalVariables.firstName = text,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: "Enter First Name here",
                      hintStyle: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 32, 8, 8),
            child: SizedBox(
              width: width / 2 - 16,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Last Name (Optional)",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    onChanged: (text) => GlobalVariables.lastName = text,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: "Enter Last Name here",
                      hintStyle: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
