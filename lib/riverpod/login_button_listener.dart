import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoolLogin extends Notifier<bool> {
  @override
  bool build() {
    return true; // Consider starting with true as a default
  }

  void toggleLogin() {
    // More descriptive method name
    state = true;
  }

  bool returnLoginState() {
    return state;
  }

  void toggleSignUp() {
    // More descriptive method name
    state = false;
  }
}

final isLoginPressedProvider = NotifierProvider<BoolLogin, bool>(() {
  return BoolLogin();
});
