import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookmark_riverpod = StateProvider<bool>((ref) {
  return false;
});

final bookmarkedJobsProvider = StateProvider<List>((ref) {
  return [];
});
