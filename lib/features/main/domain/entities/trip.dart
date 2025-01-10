import 'package:equatable/equatable.dart';

import '../../../../core/utils/app_enums.dart';
import 'address.dart';

class Trip extends Equatable {
  final TripStatus tripStatus;
  final Address pickUpAddress;
  final Address dropOfAddress;
  final double calculatedDistance;
  final double calculatedDuration;
  final String? driverName;

  const Trip({
    required this.tripStatus,
    required this.pickUpAddress,
    required this.dropOfAddress,
    required this.calculatedDistance,
    required this.calculatedDuration,
    required this.driverName,
  });

  @override
  List<Object?> get props => [
        tripStatus,
        pickUpAddress,
        dropOfAddress,
        calculatedDistance,
        calculatedDuration,
        driverName,
      ];
}
