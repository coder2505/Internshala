import 'package:flutter/material.dart';
import 'package:internshala/global_variables.dart';

class RecruiteeSignupDetailsCity {
  Widget design(double width, double height) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 20, 8, 8),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Current City",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 6),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "To Connect you with oppurtunities closer to you",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              onChanged: (value) => GlobalVariables.contactNumber,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: "City",
                hintStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
