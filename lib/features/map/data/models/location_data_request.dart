import 'package:equatable/equatable.dart';

class LocationDataRequest extends Equatable {
  final double? latitude;
  final double? longitude;

  const LocationDataRequest({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}
