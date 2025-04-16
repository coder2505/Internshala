import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:internshala/designs/pages_designs/recruitee_homepagedesigns.dart/recruitee_homescreen.dart';

class RecuiterHomepage extends StatefulWidget {
  const RecuiterHomepage({super.key});

  @override
  State<RecuiterHomepage> createState() => _RecuiterHomepageState();
}

class _RecuiterHomepageState extends State<RecuiterHomepage> {
  List screen = [
    RecruiteeHomescreen().homescreen(),
    Center(child: Text("Internships")),
    Center(child: Text("Jobs")),
    TextButton(
      onPressed: () {
        FirebaseAuth.instance.signOut();
      },
      child: Text("LOGOUT"),
    ),
  ];

  int screenindex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
              GButton(icon: Icons.work_rounded, text: "Jobs"),
              GButton(icon: Icons.account_circle_outlined, text: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
