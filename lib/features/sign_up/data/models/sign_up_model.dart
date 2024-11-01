import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable(createToJson: false)
class SignUpModel {
  final int userId;
  final String token;

  SignUpModel({
    required this.userId,
    required this.token,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);
}
