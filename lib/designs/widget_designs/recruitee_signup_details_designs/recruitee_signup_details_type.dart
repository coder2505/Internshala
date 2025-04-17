import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/riverpod/signup_details.dart';

class RecruiteeSignupDetailsType {
  Widget design(double width, double height, WidgetRef ref) {
    ref.watch(typeProvider);

    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Type",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: 8),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(typeProvider.notifier).state = 0;
                  },
                  child: Container(
                    height: 50,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref.read(typeProvider.notifier).state == 0
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Center(child: Text('College Student')),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    ref.read(typeProvider.notifier).state = 1;
                  },
                  child: Container(
                    height: 50,
                    width: width * 0.25,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref.read(typeProvider.notifier).state == 1
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Center(child: Text('Fresher')),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ref.read(typeProvider.notifier).state = 2;
                  },
                  child: Container(
                    height: 50,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref.read(typeProvider.notifier).state == 2
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Center(child: Text('Working Professional')),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ref.read(typeProvider.notifier).state = 3;
                  },
                  child: Container(
                    height: 50,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref.read(typeProvider.notifier).state == 3
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Center(child: Text('School Student')),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ref.read(typeProvider.notifier).state = 4;
                  },
                  child: Container(
                    height: 50,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref.read(typeProvider.notifier).state == 4
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Center(child: Text('Woman Returning To Work')),
                  ),
                ),
              ],
            ),
 
          ],
        ),
      ),
    );
  }
}
