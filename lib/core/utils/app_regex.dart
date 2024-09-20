class AppRegex {
  AppRegex._();

  static bool isMobileNumberValid(String mobileNumber) {
    return RegExp(r"^[+]*[0-9]+").hasMatch(mobileNumber);
  }
}
