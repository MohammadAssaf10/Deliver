import 'package:json_annotation/json_annotation.dart';

part 'sign_in_model.g.dart';

@JsonSerializable(createToJson: false)
class SignInModel {
  final int id;
  final bool isPhoneNumberVerified;
  final String token;

  SignInModel({
    required this.id,
    required this.token,
    required this.isPhoneNumberVerified,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);
}
