class Endpoints {
  Endpoints._();

  static String baseUrl = 'http://145.223.101.137:8080/v1';

  static String signIn = '/Rider/signin';
  static String signUp = '/Rider/signup';
  static String generateVerificationCode = '/Account/generateVerificationCode';
  static String getVerificationCode = '/Account/getVerificationCode';
  static String verifyPhoneNumber = '/Account/verifyPhone';
  static String distance = '/distance/distance';
}
