// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      markerState:
          $enumDecodeNullable(_$MarkerStateEnumMap, json['markerState']),
      administrativeArea: json['administrativeArea'] as String?,
      locality: json['locality'] as String?,
      street: json['street'] as String?,
    );

const _$MarkerStateEnumMap = {
  MarkerState.start: 'start',
  MarkerState.end: 'end',
};
