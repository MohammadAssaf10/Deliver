// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripHistoryModel _$TripHistoryModelFromJson(Map<String, dynamic> json) =>
    TripHistoryModel(
      id: (json['id'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      calculatedDistance: (json['calculatedDistance'] as num).toDouble(),
      calculatedDuration: (json['calculatedDuration'] as num).toDouble(),
      createdDate: (json['createdDate'] as num).toInt(),
    );
