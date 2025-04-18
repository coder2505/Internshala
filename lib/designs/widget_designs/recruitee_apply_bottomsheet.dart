import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshala/firebase/applytojob.dart';
import 'package:internshala/riverpod/recuitee_homepage_riverpod.dart';

class RecruiteeApplyBottomsheet {
  String link = "";
  Widget showsheet(BuildContext context, WidgetRef ref) {
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

              TextField(
                decoration: InputDecoration(),
                onChanged: (val) {
                  link = val;
                },
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () async {
            if (context.mounted) {
              var a = await Applytojob().applytojob(
                FirebaseAuth.instance.currentUser?.uid,
                (ref.read(JobDetailsProvider.notifier).state)?.id,
                link,
              );
              if (context.mounted) Navigator.pop(context);
              if (a == true && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Job Successfully applied')),
                );
              } else if (a == false && context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Already applied')));
              }
            }
          },
          child: Text('Submit', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
