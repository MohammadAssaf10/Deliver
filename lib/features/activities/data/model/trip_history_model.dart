import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/constant.dart';
import '../../domain/entities/trip_history.dart';

part 'trip_history_model.g.dart';

@JsonSerializable(createToJson: false)
class TripHistoryModel {
  final int id;
  final int status;
  final double calculatedDistance;
  final double calculatedDuration;
  final int createdDate;

  TripHistoryModel({
    required this.id,
    required this.status,
    required this.calculatedDistance,
    required this.calculatedDuration,
    required this.createdDate,
  });

  factory TripHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TripHistoryModelFromJson(json);

  TripHistory toDomain() => TripHistory(
        id: id,
        status: Constant.tripStatusMap[status]!,
        calculatedDuration: calculatedDuration,
        calculatedDistance: calculatedDistance,
        createdDate: createdDate,
      );
}
