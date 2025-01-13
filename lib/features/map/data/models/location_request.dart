import 'package:equatable/equatable.dart';

class LocationRequest extends Equatable {
  final double longitude;
  final double latitude;

  const LocationRequest({
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object?> get props => [
        longitude,
        latitude,
      ];
}
