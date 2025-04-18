import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/designs/widget_designs/recruitee_apply_bottomsheet.dart';
import 'package:internshala/riverpod/recuitee_homepage_riverpod.dart';

class JobDetails extends ConsumerStatefulWidget {
  final String id;
  const JobDetails({super.key, required this.id});

  @override
  ConsumerState<JobDetails> createState() => _JobDetailsState(id: id);
}

class _JobDetailsState extends ConsumerState<JobDetails> {
  final String id;
  DocumentSnapshot? documentSnapshot;

  _JobDetailsState({required this.id});

  Future<void> loaddata(WidgetRef ref) async {
    try {
      documentSnapshot =
          await FirebaseFirestore.instance
              .collection('RecruiterData')
              .doc(id)
              .get();

      ref.read(JobDetailsProvider.notifier).state = documentSnapshot;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    loaddata(ref);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(JobDetailsProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Internship Details'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'About ${ref.read(JobDetailsProvider.notifier).state?['Name']}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${ref.read(JobDetailsProvider.notifier).state?['About']}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Internship Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${ref.read(JobDetailsProvider.notifier).state?['Internship About']}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 32),

              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Who Can Apply',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${ref.read(JobDetailsProvider.notifier).state?['Who can apply']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 32),

              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Number Of Openings',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${ref.read(JobDetailsProvider.notifier).state?['Openings']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 32),

              Row(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${ref.read(JobDetailsProvider.notifier).state?['Location']}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pay',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${ref.read(JobDetailsProvider.notifier).state?['Pay']}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32),

              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Additional Info',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${ref.read(JobDetailsProvider.notifier).state?['Additional Info']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: RecruiteeApplyBottomsheet().showsheet(
                          context,
                          ref,
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: const Color.fromARGB(142, 255, 255, 255),
                      width: 4,
                    ),
                  ),
                  child: Center(
                    child: Text('Apply', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
