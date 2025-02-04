import 'package:equatable/equatable.dart';

import '../models/address.dart';
import '../utils/app_enums.dart';

class Trip extends Equatable {
  final int id;
  final TripStatus tripStatus;
  final Address pickUpAddress;
  final Address dropOfAddress;
  final double calculatedDistance;
  final double calculatedDuration;
  final String? driverName;
  final String createdDate;

  const Trip({
    required this.id,
    required this.tripStatus,
    required this.pickUpAddress,
    required this.dropOfAddress,
    required this.calculatedDistance,
    required this.calculatedDuration,
    this.driverName,
    required this.createdDate,
  });

  @override
  List<Object?> get props => [
        id,
        tripStatus,
        pickUpAddress,
        dropOfAddress,
        calculatedDistance,
        calculatedDuration,
        driverName,
        createdDate,
      ];

  Trip copyWith({
    int? id,
    TripStatus? tripStatus,
    Address? pickUpAddress,
    Address? dropOfAddress,
    double? calculatedDistance,
    double? calculatedDuration,
    String? driverName,
    String? createdDate,
  }) {
    return Trip(
      id: id ?? this.id,
      tripStatus: tripStatus ?? this.tripStatus,
      pickUpAddress: pickUpAddress ?? this.pickUpAddress,
      dropOfAddress: dropOfAddress ?? this.dropOfAddress,
      calculatedDistance: calculatedDistance ?? this.calculatedDistance,
      calculatedDuration: calculatedDuration ?? this.calculatedDuration,
      driverName: driverName ?? this.driverName,
      createdDate: createdDate ?? this.createdDate,
    );
  }
}
