import 'package:equatable/equatable.dart';

class TripDistanceAndDuration extends Equatable {
  final double distance;
  final double duration;

  const TripDistanceAndDuration({
    required this.distance,
    required this.duration,
  });

  @override
  List<Object?> get props => [
        distance,
        duration,
      ];
}
