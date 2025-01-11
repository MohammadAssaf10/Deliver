import 'package:equatable/equatable.dart';

import '../models/location_request.dart';
import '../utils/app_enums.dart';

class Address extends Equatable {
  final MarkerState? markerState;
  final double longitude;
  final double latitude;
  final String? administrativeArea;
  final String? locality;
  final String? street;

  const Address({
    required this.longitude,
    required this.latitude,
    this.street,
    this.locality,
    this.administrativeArea,
    this.markerState,
  });

  @override
  List<Object?> get props => [
        longitude,
        latitude,
        street,
        locality,
        administrativeArea,
        markerState,
      ];

  Address copyWith({
    MarkerState? markerState,
    double? longitude,
    double? latitude,
    String? administrativeArea,
    String? locality,
    String? street,
  }) {
    return Address(
      markerState: markerState ?? this.markerState,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      administrativeArea: administrativeArea ?? this.administrativeArea,
      locality: locality ?? this.locality,
      street: street ?? this.street,
    );
  }

  LocationRequest toLocationRequest() {
    return LocationRequest(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
