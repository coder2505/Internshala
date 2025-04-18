import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:internshala/designs/pages_designs/recruitee_homepagedesigns.dart/recruitee_homescreen.dart';
import 'package:internshala/designs/pages_designs/recruitee_homepagedesigns.dart/recruitee_internships.dart';

class RecuiterHomepage extends ConsumerStatefulWidget {
  const RecuiterHomepage({super.key});

  @override
  ConsumerState<RecuiterHomepage> createState() => _RecuiterHomepageState();
}

class _RecuiterHomepageState extends ConsumerState<RecuiterHomepage> {
  int screenindex = 0;

  @override
  Widget build(BuildContext context) {
    List screen = [
      RecruiteeHomescreen().homescreen(context, ref),
      RecruiteeInternships(),
      TextButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          if (context.mounted) Navigator.pop(context);
        },
        child: Text("LOGOUT"),
      ),
    ];

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'lib/assets/images/internshalaLogo.png',
              width: width * 0.5,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: width * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
                ],
              ),
            ),
          ],
        ),
      ),

      body: Scaffold(
        body: Center(child: screen[screenindex]),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
          child: GNav(
            gap: 8,
            tabBackgroundColor: const Color.fromARGB(137, 0, 81, 146),
            tabActiveBorder: Border.all(
              color: const Color.fromARGB(107, 255, 255, 255),
            ),
            padding: EdgeInsets.all(16), // navigation bar padding
            onTabChange: (value) {
              setState(() {
                screenindex = value;
              });
            },
            tabs: const [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.school, text: "Internship"),
              GButton(icon: Icons.account_circle_outlined, text: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
