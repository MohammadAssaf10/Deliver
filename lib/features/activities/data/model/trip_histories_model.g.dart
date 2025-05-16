// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_histories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripHistoriesModel _$TripHistoriesModelFromJson(Map<String, dynamic> json) =>
    TripHistoriesModel(
      tripHistories:
          (json['data'] as List<dynamic>)
              .map((e) => TripHistoryModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
