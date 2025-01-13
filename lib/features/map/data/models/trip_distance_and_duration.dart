import 'package:json_annotation/json_annotation.dart';

part 'trip_distance_and_duration.g.dart';

@JsonSerializable(createToJson: false)
class TripDistanceAndDuration {
  final double distance;
  final double duration;

  TripDistanceAndDuration({
    required this.distance,
    required this.duration,
  });

  factory TripDistanceAndDuration.fromJson(Map<String, dynamic> json) =>
      _$TripDistanceAndDurationFromJson(json);
}
