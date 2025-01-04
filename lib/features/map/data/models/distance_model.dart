import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/distance.dart';

part 'distance_model.g.dart';

@JsonSerializable(createToJson: false)
class DistanceModel {
  final double distance;
  final int duration;

  DistanceModel({
    required this.distance,
    required this.duration,
  });

  factory DistanceModel.fromJson(Map<String, dynamic> json) =>
      _$DistanceModelFromJson(json);

  Distance toDomain() {
    return Distance(
      distance: distance,
      duration: duration,
    );
  }
}
