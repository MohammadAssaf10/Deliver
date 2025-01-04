import 'package:equatable/equatable.dart';

class Distance extends Equatable {
  final double distance;
  final int duration;

  const Distance({
    required this.distance,
    required this.duration,
  });

  @override
  List<Object?> get props => [
        distance,
        duration,
      ];
}
