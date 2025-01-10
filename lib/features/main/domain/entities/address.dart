import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final double longitude;
  final double latitude;

  const Address({
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object?> get props => [
        longitude,
        latitude,
      ];
}
