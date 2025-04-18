import 'package:cloud_firestore/cloud_firestore.dart';

class Applytojob {
  // ignore: non_constant_identifier_names
  Future<bool> applytojob(String? useruid, String? job_uid, String link) async {
    try {
      var docsnapshotuser =
          await FirebaseFirestore.instance
              .collection('RecruiteeData')
              .doc(useruid)
              .get();

      Map mapuser = docsnapshotuser.data() as Map;

      var docsnapshotrecruiter =
          await FirebaseFirestore.instance
              .collection('RecruiterData')
              .doc(job_uid)
              .get();

      Map maprecruiter = docsnapshotrecruiter.data() as Map;

      if (!(mapuser.containsKey('Applied Jobs') &&
          mapuser['Applied Jobs'].contains(job_uid))) {
        // UPDATING USER DATABASE
        List applyjobs = [];

        if (mapuser.containsKey('Applied Jobs')) {
          applyjobs = mapuser['Applied Jobs'];
        }

        applyjobs.add(job_uid);

        FirebaseFirestore.instance
            .collection('RecruiteeData')
            .doc(useruid)
            .update({'Applied Jobs': applyjobs});
      }

      //UPDATING JOB REC DATABASE
      List<Map> appliedcandidates = [];
      Map newentry = {useruid: link};

      if (!(maprecruiter.containsKey('Candidates Applied') &&
          !appliedcandidates.any((map) => map.containsKey(useruid)))) {
        if (maprecruiter.containsKey('Candidates Applied')) {
          appliedcandidates = maprecruiter['Candidates Applied'];
        }
        if (!appliedcandidates.any((map) => map.containsKey(useruid))) {
          appliedcandidates.add(newentry);
        }

        FirebaseFirestore.instance
            .collection('RecruiterData')
            .doc(job_uid)
            .update({'Candidates Applied': appliedcandidates});
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
