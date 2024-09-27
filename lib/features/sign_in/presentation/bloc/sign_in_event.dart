import 'package:built_value/built_value.dart';

part 'sign_in_event.g.dart';

abstract class SignInEvent {}

abstract class ChangePasswordVisibility extends SignInEvent
    implements
        Built<ChangePasswordVisibility, ChangePasswordVisibilityBuilder> {
  ChangePasswordVisibility._();

  factory ChangePasswordVisibility(
          [void Function(ChangePasswordVisibilityBuilder) updates]) =
      _$ChangePasswordVisibility;
}

abstract class Login extends SignInEvent implements Built<Login, LoginBuilder> {
  Login._();

  factory Login([void Function(LoginBuilder) updates]) = _$Login;
}
