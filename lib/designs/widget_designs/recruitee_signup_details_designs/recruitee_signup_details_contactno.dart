import 'package:flutter/material.dart';
import 'package:internshala/global_variables.dart';

class RecruiteeSignupDetailsContactno {
  final TextEditingController controller = TextEditingController(text: "91");

  Widget design(double width, double height) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 20, 0, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Contact Number",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: SizedBox(
                  width: width * 0.25 - 16,
                  child: Column(
                    children: [
                      TextField(
                        controller: controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: SizedBox(
                  width: width * 0.75 - 16,
                  child: Column(
                    children: [
                      TextField(
                        onChanged:
                            (text) => GlobalVariables.contactNumber = text,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: "Enter Contact Number Here",
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
