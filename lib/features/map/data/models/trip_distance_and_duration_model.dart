import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/trip_distance_and_duration.dart';

part 'trip_distance_and_duration_model.g.dart';

@JsonSerializable(createToJson: false)
class TripDistanceAndDurationModel {
  final double distance;
  final double duration;

  TripDistanceAndDurationModel({
    required this.distance,
    required this.duration,
  });

  factory TripDistanceAndDurationModel.fromJson(Map<String, dynamic> json) =>
      _$TripDistanceAndDurationModelFromJson(json);

  TripDistanceAndDuration toDomain() {
    return TripDistanceAndDuration(
      distance: distance,
      duration: duration,
    );
  }
}
