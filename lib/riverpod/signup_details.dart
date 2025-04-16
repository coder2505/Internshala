import 'package:flutter_riverpod/flutter_riverpod.dart';

class gender extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  int getState() {
    return state;
  }

  void setstate(int num) => state = num;
}

class Language extends Notifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  List<String> getstate() {
    return state;
  }

  void addstate(String lang) {
    state = [...state, lang];
  }

  void removestate(String lang) {
    state =
        state.where((item) {
          return item != lang;
        }).toList();
  }
}

int a = 0;
final typeProvider = StateProvider<int>((ref) {
  return a;
});

final langProvider = NotifierProvider<Language, List<String>>(() {
  return Language();
});

final genderProvider = NotifierProvider<gender, int>(() {
  return gender();
});
