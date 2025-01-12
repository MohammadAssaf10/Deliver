import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/entities/trip.dart';
import '../../../../core/models/address_model.dart';

part 'trip_model.g.dart';

@JsonSerializable(createToJson: false)
class TripModel {
  final int id;
  final int status;
  final AddressModel pickUpAddress;
  final AddressModel dropOfAddress;
  final int createdDate;
  final double calculatedDistance;
  final double calculatedDuration;
  final String? driverName;

  TripModel({
    required this.id,
    required this.status,
    required this.pickUpAddress,
    required this.dropOfAddress,
    required this.createdDate,
    required this.calculatedDistance,
    required this.calculatedDuration,
    required this.driverName,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);

  Trip toDomain() {
    final String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(
      DateTime.fromMillisecondsSinceEpoch(createdDate * 1000, isUtc: true),
    );
    return Trip(
      id: id,
      tripStatus: Constant.tripStatusMap[status]!,
      pickUpAddress: pickUpAddress.toDomain(),
      dropOfAddress: dropOfAddress.toDomain(),
      calculatedDistance: calculatedDistance,
      calculatedDuration: calculatedDuration,
      driverName: driverName,
      createdDate: formattedDate,
    );
  }
}
