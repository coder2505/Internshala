class GlobalVariables {
  static String _emailBox = "";
  static String _passwordBox = "";
  static int selectedOptionNavBar = 0;

  static String firstName = "";
  static String lastName = "";
  static String contactNumber = "";
  static String currentCity = "";

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

  static int genderSelect = 0;
}
