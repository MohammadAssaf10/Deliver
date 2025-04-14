import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/profile.dart';

part 'profile_model.g.dart';

@JsonSerializable(createToJson: false)
class ProfileModel {
  final int userId;
  final String name;
  final String phone;
  final String? vehicleImage;
  final String? licenseImage;
  final String? profileImage;

  ProfileModel({
    required this.userId,
    required this.name,
    required this.phone,
    this.vehicleImage,
    this.licenseImage,
    required this.profileImage,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Profile toDomain() {
    return Profile(
      userId: userId,
      name: name,
      phone: phone,
      profileImage: profileImage,
    );
  }
}
