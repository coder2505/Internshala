import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/riverpod/recuitee_homepage_riverpod.dart';

class JobsInYourArea {
  Future<void> loadData(WidgetRef ref) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('RecruiterData').get();

    String? uid = FirebaseAuth.instance.currentUser?.uid;
    DocumentSnapshot documentSnapshot;
    String city = "";
    List<QueryDocumentSnapshot> data = [];

    if (uid != null) {
      documentSnapshot =
          await FirebaseFirestore.instance
              .collection('RecruiteeData')
              .doc(uid)
              .get();

      city = documentSnapshot['city'];
    }
    for (var doc in querySnapshot.docs) {
      var map = doc.data() as Map;

      if (map['Location'] == city) {
        data.add(doc);
      }
    }

    ref.read(JobsInYourAreaProvider.notifier).state = data;
  }

  Widget jobs(WidgetRef ref) {
    ref.watch(JobsInYourAreaProvider);

    loadData(ref);
    return ListView.builder(
      itemCount: ref.read(JobsInYourAreaProvider.notifier).state.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
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
                                      .read(JobsInYourAreaProvider.notifier)
                                      .state
                                      .length >
                                  index
                              ? ref
                                  .read(JobsInYourAreaProvider.notifier)
                                  .state[index]['Internship Title']
                              : "...",
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ref
                                      .read(JobsInYourAreaProvider.notifier)
                                      .state
                                      .length >
                                  index
                              ? ref
                                  .read(JobsInYourAreaProvider.notifier)
                                  .state[index]['Name']
                              : "...",
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ref
                                      .read(JobsInYourAreaProvider.notifier)
                                      .state
                                      .length >
                                  index
                              ? ref
                                  .read(JobsInYourAreaProvider.notifier)
                                  .state[index]['Location']
                              : "...",
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ref
                                      .read(JobsInYourAreaProvider.notifier)
                                      .state
                                      .length >
                                  index
                              ? ref
                                  .read(JobsInYourAreaProvider.notifier)
                                  .state[index]['Pay']
                              : "...",
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ref
                                      .read(JobsInYourAreaProvider.notifier)
                                      .state
                                      .length >
                                  index
                              ? ref
                                  .read(JobsInYourAreaProvider.notifier)
                                  .state[index]['Duration']
                              : "...",
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
