import 'package:built_value/built_value.dart';

part 'login_event.g.dart';

abstract class LoginEvent {}

abstract class ChangePasswordVisibility extends LoginEvent
    implements
        Built<ChangePasswordVisibility, ChangePasswordVisibilityBuilder> {
  ChangePasswordVisibility._();

  factory ChangePasswordVisibility(
          [void Function(ChangePasswordVisibilityBuilder) updates]) =
      _$ChangePasswordVisibility;
}

abstract class Login extends LoginEvent implements Built<Login, LoginBuilder> {

  Login._();

  factory Login([void Function(LoginBuilder) updates]) = _$Login;
}

abstract class ClearError extends LoginEvent implements Built<ClearError, ClearErrorBuilder> {


  ClearError._();
  factory ClearError([void Function(ClearErrorBuilder) updates]) = _$ClearError;
}
