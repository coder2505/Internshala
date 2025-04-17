import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
              height: height * 0.15,
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Consumer(
                        builder: (context, ref, child) {
                          ref.watch(NameProvider);
                          loaddata(ref);
                          return Padding(
                            padding: EdgeInsets.fromLTRB(width * 0.1, 8, 8, 8),
                            child: Text(
                              "Hello ${ref.read(NameProvider.notifier).state}",
                              style: TextStyle(fontSize: 24),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(width * 0.1, 8, 8, 8),
                        child: Text(
                          "Let's Find you, your dream job.",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: SizedBox(
                height: height * 0.3,
                width: width,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                      width: width,
                      child: Text(
                        "Newly Posted Jobs",
                        style: TextStyle(fontSize: 22),
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
                    SizedBox(
                      height: height * 0.05,
                      width: width,
                      child: Text(
                        "Jobs in your area",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Expanded(child: JobsInYourArea().jobs(ref)),
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
