import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  final String email;
  final String password;
  final String phoneNumber;
  final String username;

  const RegisterRequest({
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.username,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        phoneNumber,
        username,
      ];
}
