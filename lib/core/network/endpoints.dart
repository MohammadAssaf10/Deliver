class Endpoints {
  Endpoints._();

  static String baseUrl = 'http://145.223.101.137:8080/v1';

  static String signIn = '/rider/signin';
  static String signUp = '/rider/signup';
  static String generateVerificationCode = '/Account/generateVerificationCode';
  static String getVerificationCode = '/Account/getVerificationCode';
  static String verifyPhoneNumber = '/Account/verifyPhone';
  static String tripInfo = '/distance/distance';
  static String createNewTrip = '/rider/trip';
  static String currentTrip = '/rider/trip/current';
}
