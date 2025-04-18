import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/riverpod/bookmark_riverpod.dart';

class BookmarkedJobs {
  // ignore: non_constant_identifier_names
  Future<void> loaddata(String? user_uid, WidgetRef ref) async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('RecruiterData').get();
      DocumentSnapshot map =
          await FirebaseFirestore.instance
              .collection('RecruiteeData')
              .doc(user_uid)
              .get();
      List jobs = map['Bookmarked Jobs'];
      List bookmarkedJobs = [];

      for (var docs in querySnapshot.docs) {
        if (jobs.contains(docs.id)) {
          bookmarkedJobs.add(docs);
        }
      }

      ref.read(bookmarkedJobsProvider.notifier).state = bookmarkedJobs;
    } catch (e) {
      rethrow;
    }
  }

  Widget jobs(WidgetRef ref) {
    loaddata(FirebaseAuth.instance.currentUser?.uid, ref);
    ref.watch(bookmarkedJobsProvider);

    return ListView.builder(
      itemCount: ref.read(bookmarkedJobsProvider.notifier).state.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: double.infinity,
            width: 200,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 22, 40, 48),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ref
                                  .read(bookmarkedJobsProvider.notifier)
                                  .state[index]['Internship Title'] ??
                              "...",
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ref
                                  .read(bookmarkedJobsProvider.notifier)
                                  .state[index]['Name'] ??
                              "...",
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  indent: 10,
                  endIndent: 10,
                  color: const Color.fromARGB(255, 209, 208, 208),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ref
                                  .read(bookmarkedJobsProvider.notifier)
                                  .state[index]['Location'] ??
                              "...",
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ref
                                  .read(bookmarkedJobsProvider.notifier)
                                  .state[index]['Pay'] ??
                              "...",
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ref
                                  .read(bookmarkedJobsProvider.notifier)
                                  .state[index]['Duration'] ??
                              "...",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
