import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class RecuiterBottomnavbar {
  Widget bottombar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
      child: GNav(
        gap: 8,
        tabBackgroundColor: const Color.fromARGB(137, 0, 81, 146),
        tabActiveBorder: Border.all(
          color: const Color.fromARGB(107, 255, 255, 255),
        ),
        padding: EdgeInsets.all(16), // navigation bar padding

        tabs: const [
          GButton(icon: Icons.home, text: "Home"),
          GButton(icon: Icons.add, text: "Post Job"),
          GButton(icon: Icons.account_circle_outlined, text: "Profile"),
        ],
      ),
    );
  }
}
