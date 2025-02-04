enum StringColor {
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
}

enum Language { en, ar }

enum MarkerState {
  tripStartLocation,
  tripEndLocation,
  currentLocation,
}

enum TripStatus {
  waiting,
  onWayToPickupRider,
  driverArrivedToPickupRider,
  delivering,
  delivered,
  cancelled,
}
