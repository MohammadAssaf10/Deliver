import 'package:equatable/equatable.dart';

import '../../../../core/utils/app_enums.dart';

class TripHistory extends Equatable {
  final int id;
  final TripStatus status;
  final double calculatedDistance;
  final double calculatedDuration;
  final int createdDate;

  const TripHistory({
    required this.id,
    required this.status,
    required this.calculatedDistance,
    required this.calculatedDuration,
    required this.createdDate,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        calculatedDuration,
        calculatedDistance,
        createdDate,
      ];
}
