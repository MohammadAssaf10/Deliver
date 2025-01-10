import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/trip_info.dart';

part 'trip_info_model.g.dart';

@JsonSerializable(createToJson: false)
class TripInfoModel {
  final double distance;
  final double duration;

  TripInfoModel({
    required this.distance,
    required this.duration,
  });

  factory TripInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TripInfoModelFromJson(json);

  TripInfo toDomain() {
    return TripInfo(
      distance: distance,
      duration: duration,
    );
  }
}
