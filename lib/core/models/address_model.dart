import 'package:json_annotation/json_annotation.dart';

import '../entities/address.dart';
import '../utils/app_enums.dart';

part 'address_model.g.dart';

@JsonSerializable(createToJson: false)
class AddressModel {
  final MarkerState? markerState;
  final double longitude;
  final double latitude;
  final String? administrativeArea;
  final String? locality;
  final String? street;

  AddressModel({
    required this.longitude,
    required this.latitude,
    this.markerState,
    this.administrativeArea,
    this.locality,
    this.street,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Address toDomain() {
    return Address(
      longitude: longitude,
      latitude: latitude,
      markerState: markerState,
      street: street,
      locality: locality,
      administrativeArea: administrativeArea,
    );
  }
}
