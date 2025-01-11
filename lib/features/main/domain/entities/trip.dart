import 'package:equatable/equatable.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/entities/address.dart';

class Trip extends Equatable {
  final int id;
  final TripStatus tripStatus;
  final Address pickUpAddress;
  final Address dropOfAddress;
  final double calculatedDistance;
  final double calculatedDuration;
  final String? driverName;
  final DateTime createdDate;

  const Trip({
    required this.id,
    required this.tripStatus,
    required this.pickUpAddress,
    required this.dropOfAddress,
    required this.calculatedDistance,
    required this.calculatedDuration,
    required this.driverName,
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
}
