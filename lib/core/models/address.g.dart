// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      markerState:
          $enumDecodeNullable(_$MarkerStateEnumMap, json['markerState']),
      administrativeArea: json['administrativeArea'] as String?,
      locality: json['locality'] as String?,
      street: json['street'] as String?,
    );

const _$MarkerStateEnumMap = {
  MarkerState.tripStartLocation: 'tripStartLocation',
  MarkerState.tripEndLocation: 'tripEndLocation',
  MarkerState.currentLocation: 'currentLocation',
};
