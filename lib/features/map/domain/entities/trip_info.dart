import 'package:equatable/equatable.dart';

class TripInfo extends Equatable {
  final double distance;
  final double duration;

  const TripInfo({
    required this.distance,
    required this.duration,
  });

  @override
  List<Object?> get props => [
        distance,
        duration,
      ];
}
