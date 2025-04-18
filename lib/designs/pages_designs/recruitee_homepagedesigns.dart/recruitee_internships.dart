import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/designs/pages_designs/job_details.dart';
import 'package:internshala/riverpod/recuitee_homepage_riverpod.dart';

class RecruiteeInternships extends ConsumerStatefulWidget {
  const RecruiteeInternships({super.key});

  @override
  ConsumerState<RecruiteeInternships> createState() =>
      _RecruiteeInternshipsState();
}

class _RecruiteeInternshipsState extends ConsumerState<RecruiteeInternships> {
  @override
  Widget build(BuildContext context) {
    ref.watch(newlyPostedJobsProvider);
    return ListView.builder(
      itemCount: ref.read(newlyPostedJobsProvider.notifier).state.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 19, 31, 37),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          style: TextStyle(fontSize: 24),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ref
                                  .read(newlyPostedJobsProvider.notifier)
                                  .state[index]['Name'] ??
                              "...",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(indent: 25, endIndent: 25),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(width: 10),
                            Text(
                              ref
                                      .read(newlyPostedJobsProvider.notifier)
                                      .state[index]['Location'] ??
                                  "...",
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(Icons.calendar_month),
                            SizedBox(width: 10),
                            Text(
                              ref
                                      .read(newlyPostedJobsProvider.notifier)
                                      .state[index]['Duration'] ??
                                  "...",
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(Icons.money),
                            SizedBox(width: 10),
                            Text(
                              ref
                                      .read(newlyPostedJobsProvider.notifier)
                                      .state[index]['Pay'] ??
                                  "...",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return JobDetails(
                                id:
                                    ref
                                        .read(newlyPostedJobsProvider.notifier)
                                        .state[index]
                                        .id,
                              );
                            },
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          'View Details',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
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
