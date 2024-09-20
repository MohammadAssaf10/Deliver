import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  final String password;
  final String phoneNumber;
  final String username;

  const RegisterRequest({
    required this.password,
    required this.phoneNumber,
    required this.username,
  });

  @override
  List<Object?> get props => [
        password,
        phoneNumber,
        username,
      ];
}
