import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/riverpod/bookmark_riverpod.dart';

class Bookmark {
  // ignore: non_constant_identifier_names
  Future<void> clicked(String? job_uid, String? user_uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance
              .collection('RecruiteeData')
              .doc(user_uid)
              .get();

      Map usermap = documentSnapshot.data() as Map;

      if (usermap.containsKey('Bookmarked Jobs')) {
        /*ALREADY BOOKMARKED*/
        if (usermap['Bookmarked Jobs'].contains(job_uid)) {
          List bookmarkjobs = usermap['Bookmarked Jobs'];

          bookmarkjobs.remove(job_uid);

          FirebaseFirestore.instance
              .collection('RecruiteeData')
              .doc(user_uid)
              .update({'Bookmarked Jobs': bookmarkjobs});
        } else
        /*ADD BOOKMARK*/
        {
          List bookmarkjobs = usermap['Bookmarked Jobs'];
          bookmarkjobs.add(job_uid);

          FirebaseFirestore.instance
              .collection('RecruiteeData')
              .doc(user_uid)
              .update({'Bookmarked Jobs': bookmarkjobs});
        }
      } else
      /*USER NEVER BOOKMARKED BEFORE*/
      {
        List bookmarkjobs = [];
        bookmarkjobs.add(job_uid);

        FirebaseFirestore.instance
            .collection('RecruiteeData')
            .doc(user_uid)
            .update({'Bookmarked Jobs': bookmarkjobs});
      }
    } catch (e) {
      rethrow;
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> hasbeenbookmarked(
    String? job_uid,
    String? user_uid,
    WidgetRef ref,
  ) async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance
              .collection('RecruiteeData')
              .doc(user_uid)
              .get();

      Map usermap = documentSnapshot.data() as Map;

      if (usermap.containsKey('Bookmarked Jobs')) {
        /*ALREADY BOOKMARKED*/
        if (usermap['Bookmarked Jobs'].contains(job_uid)) {
          ref.read(bookmark_riverpod.notifier).state = true;
          // return true;
          // return Icon(Icons.bookmark_added);
        } else {
          /*ADD BOOKMARK*/
          // return false;
          ref.read(bookmark_riverpod.notifier).state = false;

          // return Icon(Icons.bookmark);
        }
      } else {
        // return false;
        ref.read(bookmark_riverpod.notifier).state = false;

        // return Icon(Icons.bookmark);
      }
    } catch (e) {
      rethrow;
    }
  }
}
