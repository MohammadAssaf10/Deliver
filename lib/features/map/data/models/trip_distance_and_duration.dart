import 'package:json_annotation/json_annotation.dart';

part 'trip_distance_and_duration.g.dart';

@JsonSerializable(createToJson: false)
class TripDistanceAndDuration {
  final num distance;
  final num duration;
  final num price;

  TripDistanceAndDuration({
    required this.distance,
    required this.duration,
    required this.price,
  });

  factory TripDistanceAndDuration.fromJson(Map<String, dynamic> json) =>
      _$TripDistanceAndDurationFromJson(json);
}
