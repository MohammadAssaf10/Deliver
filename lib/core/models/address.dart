import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../features/map/data/models/location_request.dart';
import '../utils/app_enums.dart';

part 'address.g.dart';

@JsonSerializable(createToJson: false)
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
    this.markerState,
    this.administrativeArea,
    this.locality,
    this.street,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  LocationRequest toLocationRequest() {
    return LocationRequest(
      longitude: longitude,
      latitude: latitude,
    );
  }

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

  @override
  List<Object?> get props => [
        longitude,
        latitude,
        markerState,
        administrativeArea,
        locality,
        street,
      ];
}
