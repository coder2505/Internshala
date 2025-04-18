import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internshala/assets/utils/dummydata.dart';

class Firebaseadddummydata {
  int a = 0;
  Future<void> addDummyData() async {
    a = await getCountCollection("RecruiterData");

    if (a == 1) {
      addData();
    }
  }

  void addData() {
    for (int i = 0; i < 13; i++) {
      try {
        FirebaseFirestore.instance.collection("RecruiterData").add({
          "About": Dummydata().about[i],
          "Additional Info": Dummydata().additionalInfo[i],
          "Deadline": Dummydata().deadline[i],
          "Duration": Dummydata().duration[i],
          "Internship About": Dummydata().internshipAbout[i],
          "Internship Title": Dummydata().internshipTitle[i],
          "Location": Dummydata().location[i],
          "Name": Dummydata().name[i],
          "Openings": Dummydata().openings[i],
          "Pay": Dummydata().pay[i],
          "Starts From": Dummydata().startsFrom[i],
          "Who can apply": Dummydata().whoCanApply[i],
        });
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<int> getCountCollection(String collectionName) async {
    final collection = FirebaseFirestore.instance.collection(collectionName);

    QuerySnapshot snapshot = await collection.get();

    return snapshot.docs.length;
  }
}
