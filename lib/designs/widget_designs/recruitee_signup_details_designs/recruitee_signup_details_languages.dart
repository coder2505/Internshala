import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/riverpod/signup_details.dart';

class RecruiteeSignupDetailsLanguages {
  Widget design(double width, double height, WidgetRef ref) {
    ref.watch(langProvider);

    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 16, 8, 8),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Lanuages",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                GestureDetector(
                  onTap: () {
                    ref
                            .read(langProvider.notifier)
                            .getstate()
                            .contains("English")
                        ? ref.read(langProvider.notifier).removestate("English")
                        : ref.read(langProvider.notifier).addstate("English");
                  },
                  child: Container(
                    width: width * 0.25,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref
                                    .watch(langProvider.notifier)
                                    .getstate()
                                    .contains("English")
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("English"),
                          Icon(
                            ref
                                    .watch(langProvider.notifier)
                                    .getstate()
                                    .contains("English")
                                ? Icons.check
                                : Icons.add,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    ref.read(langProvider.notifier).getstate().contains("Hindi")
                        ? ref.read(langProvider.notifier).removestate("Hindi")
                        : ref.read(langProvider.notifier).addstate("Hindi");
                  },
                  child: Container(
                    width: width * 0.25,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref
                                    .watch(langProvider.notifier)
                                    .getstate()
                                    .contains("Hindi")
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Hindi"),
                          Icon(
                            ref
                                    .watch(langProvider.notifier)
                                    .getstate()
                                    .contains("Hindi")
                                ? Icons.check
                                : Icons.add,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    ref.read(langProvider.notifier).getstate().contains("Tel")
                        ? ref.read(langProvider.notifier).removestate("Tel")
                        : ref.read(langProvider.notifier).addstate("Tel");
                  },
                  child: Container(
                    width: width * 0.25,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref
                                    .watch(langProvider.notifier)
                                    .getstate()
                                    .contains("Tel")
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Telugu"),
                          Icon(
                            ref
                                    .watch(langProvider.notifier)
                                    .getstate()
                                    .contains("Tel")
                                ? Icons.check
                                : Icons.add,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    ref.read(langProvider.notifier).getstate().contains("Tamil")
                        ? ref.read(langProvider.notifier).removestate("Tamil")
                        : ref.read(langProvider.notifier).addstate("Tamil");
                  },
                  child: Container(
                    width: width * 0.25,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref
                                    .watch(langProvider.notifier)
                                    .getstate()
                                    .contains("Tamil")
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Tamil"),
                          Icon(
                            ref
                                    .watch(langProvider.notifier)
                                    .getstate()
                                    .contains("Tamil")
                                ? Icons.check
                                : Icons.add,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    ref
                            .read(langProvider.notifier)
                            .getstate()
                            .contains("Marathi")
                        ? ref.read(langProvider.notifier).removestate("Marathi")
                        : ref.read(langProvider.notifier).addstate("Marathi");
                  },
                  child: Container(
                    width: width * 0.25,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref
                                    .watch(langProvider.notifier)
                                    .getstate()
                                    .contains("Marathi")
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Marathi"),
                          Icon(
                            ref
                                    .watch(langProvider.notifier)
                                    .getstate()
                                    .contains("Marathi")
                                ? Icons.check
                                : Icons.add,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    ref
                            .read(langProvider.notifier)
                            .getstate()
                            .contains("French")
                        ? ref.read(langProvider.notifier).removestate("French")
                        : ref.read(langProvider.notifier).addstate("French");
                  },
                  child: Container(
                    width: width * 0.25,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref
                                    .watch(langProvider.notifier)
                                    .getstate()
                                    .contains("French")
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("French"),
                          Icon(
                            ref
                                    .watch(langProvider.notifier)
                                    .getstate()
                                    .contains("French")
                                ? Icons.check
                                : Icons.add,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    ref.read(langProvider.notifier).getstate().contains("Jap")
                        ? ref.read(langProvider.notifier).removestate("Jap")
                        : ref.read(langProvider.notifier).addstate("Jap");
                  },
                  child: Container(
                    width: width * 0.28,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            ref
                                    .watch(langProvider.notifier)
                                    .getstate()
                                    .contains("Jap")
                                ? Colors.blue
                                : Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Japanese"),
                          Icon(
                            ref
                                    .watch(langProvider.notifier)
                                    .getstate()
                                    .contains("Jap")
                                ? Icons.check
                                : Icons.add,
                          ),
                        ],
                      ),
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
