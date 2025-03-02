import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/entities/trip.dart';
import '../../../../core/models/address.dart';

part 'trip_model.g.dart';

@JsonSerializable(createToJson: false)
class TripModel {
  final int id;
  final int status;
  final Address pickUpAddress;
  final Address dropOffAddress;
  final int createdDate;
  final double calculatedDistance;
  final double calculatedDuration;
  final String? driverName;

  TripModel({
    required this.id,
    required this.status,
    required this.pickUpAddress,
    required this.dropOffAddress,
    required this.createdDate,
    required this.calculatedDistance,
    required this.calculatedDuration,
    required this.driverName,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);

  Trip toDomain() {
    return Trip(
      id: id,
      tripStatus: Constant.tripStatusMap[status]!,
      pickUpAddress: pickUpAddress,
      dropOffAddress: dropOffAddress,
      calculatedDistance: calculatedDistance,
      calculatedDuration: calculatedDuration,
      driverName: driverName,
      createdDate: createdDate.convertToStringDateTime(),
    );
  }
}
