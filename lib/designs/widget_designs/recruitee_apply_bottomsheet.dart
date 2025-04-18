import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecruiteeApplyBottomsheet {
  Widget showsheet(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your public resume link",
                  style: GoogleFonts.merriweather(),
                ),
              ),

              TextField(decoration: InputDecoration()),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          child: Text('Submit', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
