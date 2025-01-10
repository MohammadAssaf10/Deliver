import 'app_enums.dart';

class Constant {
  Constant._();

  static final Map<int, TripStatus> tripStatusMap = {
    0: TripStatus.waiting,
    1: TripStatus.onWayToPickupRider,
    2: TripStatus.driverArrivedToPickupRider,
    3: TripStatus.delivering,
    4: TripStatus.delivered,
    5: TripStatus.cancelled,
  };
}

class LocalStorageKeys {
  LocalStorageKeys._();

  static String appLanguage = 'appLanguage';
  static String userToken = 'userToken';
  static String loggedInDate = 'loggedInDate';
  static String phoneNumber = 'phoneNumber';
  static String password = 'password';
}
