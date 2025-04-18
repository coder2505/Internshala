import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshala/designs/widget_designs/recruitee_home_page_designs/bookmarked_jobs.dart';
import 'package:internshala/designs/widget_designs/recruitee_home_page_designs/jobs_in_your_area.dart';
import 'package:internshala/designs/widget_designs/recruitee_home_page_designs/newly_posted_jobs.dart';
import 'package:internshala/riverpod/recuitee_homepage_riverpod.dart';

class RecruiteeHomescreen {
  String? name;

  Future<void> loaddata(WidgetRef ref) async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance
            .collection('RecruiteeData')
            .doc('${FirebaseAuth.instance.currentUser?.uid}')
            .get();

    if (documentSnapshot.exists) {
      var data = documentSnapshot.data() as Map;

      ref.read(NameProvider.notifier).state = data['firstName'];
    }
  }

  Widget homescreen(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Consumer(
                        builder: (context, ref, child) {
                          ref.watch(NameProvider);
                          loaddata(ref);
                          return Text(
                            "Welcome ${ref.read(NameProvider.notifier).state} :)",
                            style: GoogleFonts.lora(
                              fontSize: 32,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              child: SizedBox(
                height: height * 0.3,
                width: width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                      child: SizedBox(
                        height: height * 0.05,
                        width: width,
                        child: Text(
                          "Newly Posted Jobs",
                          style: GoogleFonts.merriweather(fontSize: 24),
                        ),
                      ),
                    ),
                    Expanded(child: JobsNearYourArea().jobs(ref)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              child: SizedBox(
                height: height * 0.3,
                width: width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                      child: SizedBox(
                        height: height * 0.05,
                        width: width,
                        child: Text(
                          "Jobs in your area",
                          style: GoogleFonts.merriweather(fontSize: 24),
                        ),
                      ),
                    ),
                    Expanded(child: JobsInYourArea().jobs(ref)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              child: SizedBox(
                height: height * 0.3,
                width: width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                      child: SizedBox(
                        height: height * 0.05,
                        width: width,
                        child: Text(
                          "Bookmarked Jobs",
                          style: GoogleFonts.merriweather(fontSize: 24),
                        ),
                      ),
                    ),
                    Expanded(child: BookmarkedJobs().jobs(ref)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
