import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(createToJson: false,checked: true)
class Profile {
  final int userId;
  final String name;
  final String phone;
  final String? profileImage;

  Profile({
    required this.userId,
    required this.name,
    required this.phone,
    required this.profileImage,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Profile copyWith({
    int? userId,
    String? name,
    String? phone,
    String? profileImage,
  }) {
    return Profile(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
