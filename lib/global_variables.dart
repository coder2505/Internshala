class GlobalVariables {
  static String _emailBox = "";
  static String _passwordBox = "";

  set emailBox(String e) {
    _emailBox = e;
  }

  set passwordBox(String p) {
    _passwordBox = p;
  }

  String get emailBox {
    return _emailBox;
  }

  String get passwordBox {
    return _passwordBox;
  }
}
