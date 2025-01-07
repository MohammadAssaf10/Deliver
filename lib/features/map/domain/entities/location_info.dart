import 'package:equatable/equatable.dart';

import '../../../../core/utils/app_enums.dart';

class LocationInfo extends Equatable {
  final MarkerState? markerState;
  final double? latitude;
  final double? longitude;
  final String? administrativeArea;
  final String? locality;
  final String? street;

  const LocationInfo({
    required this.latitude,
    required this.longitude,
    this.markerState,
    this.administrativeArea,
    this.locality,
    this.street,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        administrativeArea,
        locality,
        street,
        markerState,
      ];

  LocationInfo copyWith({
    MarkerState? markerState,
    double? latitude,
    double? longitude,
    String? administrativeArea,
    String? locality,
    String? street,
  }) {
    return LocationInfo(
      markerState: markerState ?? this.markerState,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      administrativeArea: administrativeArea ?? this.administrativeArea,
      locality: locality ?? this.locality,
      street: street ?? this.street,
    );
  }
}
