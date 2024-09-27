import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: false)
class UserModel {
  final int id;
  final bool? isPhoneNumberVerified;
  final String token;

  UserModel({
    required this.id,
    this.isPhoneNumberVerified,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
