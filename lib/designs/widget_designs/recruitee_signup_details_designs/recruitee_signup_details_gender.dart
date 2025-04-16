import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/riverpod/signup_details.dart';

class RecruiteeSignupDetailsGender {
  Widget design(double width, double height, WidgetRef ref) {
    ref.watch(genderProvider);
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Gender",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(genderProvider.notifier).setstate(1);
                  },
                  child: Container(
                    width: width * 0.25,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref.watch(genderProvider.notifier).getState() == 1
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Icon(Icons.male), Text("Male")],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ref.read(genderProvider.notifier).setstate(2);
                  },
                  child: Container(
                    width: width * 0.25,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref.watch(genderProvider.notifier).getState() == 2
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Icon(Icons.female), Text("Female")],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ref.read(genderProvider.notifier).setstate(3);
                  },
                  child: Container(
                    width: width * 0.25,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref.watch(genderProvider.notifier).getState() == 3
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text("Others")],
                    ),
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
