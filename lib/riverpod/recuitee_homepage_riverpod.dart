import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';

final NameProvider = StateProvider<String>((ref) {
  return "";
});

final newlyPostedJobsProvider = StateProvider<List<QueryDocumentSnapshot>>((
  ref,
) {
  return [];
});

final JobsInYourAreaProvider = StateProvider<List<QueryDocumentSnapshot>>((
  ref,
) {
  return [];
});
