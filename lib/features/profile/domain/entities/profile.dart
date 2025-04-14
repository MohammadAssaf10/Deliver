import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final int userId;
  final String name;
  final String phone;
  final String? profileImage;

  const Profile({
    required this.userId,
    required this.name,
    required this.phone,
    required this.profileImage,
  });

  @override
  List<Object?> get props => [
        userId,
        name,
        phone,
        profileImage,
      ];
}
