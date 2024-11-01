class Endpoints {
  Endpoints._();

  // static String baseUrl = 'http://192.168.43.220:5005/v1';
  static String baseUrl = 'http://localhost:5005/v1';
  static String signIn = '/Rider/signin';
  static String signUp = '/Rider/signup';
  static String generateVerificationCode = '/Account/generateVerificationCode';
  static String getVerificationCode = '/Account/getVerificationCode';
  static String verifyPhoneNumber = '/Account/verifyPhone';
}
