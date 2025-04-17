import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/riverpod/recuitee_homepage_riverpod.dart';

class JobsNearYourArea {
  String? title, recruiterName, location, pay, duration;
  List? data;

  Future<void> loadData(WidgetRef ref) async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("RecruiterData").get();

      ref.read(newlyPostedJobsProvider.notifier).state = snapshot.docs;
    } catch (e) {
      rethrow;
    }
  }

  Widget jobs(WidgetRef ref) {
    loadData(ref);
    ref.watch(newlyPostedJobsProvider);
    int len = ref.read(newlyPostedJobsProvider.notifier).state.length;

    return ListView.builder(
      itemCount: len < 10 ? len : 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: double.infinity,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
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
                                  .read(newlyPostedJobsProvider.notifier)
                                  .state[index]['Internship Title'] ??
                              "...",
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ref
                                  .read(newlyPostedJobsProvider.notifier)
                                  .state[index]['Name'] ??
                              "...",
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 0.5, indent: 10, endIndent: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ref
                                  .read(newlyPostedJobsProvider.notifier)
                                  .state[index]['Location'] ??
                              "...",
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ref
                                  .read(newlyPostedJobsProvider.notifier)
                                  .state[index]['Pay'] ??
                              "...",
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ref
                                  .read(newlyPostedJobsProvider.notifier)
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
