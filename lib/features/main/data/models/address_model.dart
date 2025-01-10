import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/address.dart';

part 'address_model.g.dart';

@JsonSerializable(createToJson: false)
class AddressModel {
  final double longitude;
  final double latitude;

  AddressModel({
    required this.longitude,
    required this.latitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Address toDomain() {
    return Address(
      longitude: longitude,
      latitude: latitude,
    );
  }
}
