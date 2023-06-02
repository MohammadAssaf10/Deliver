part of 'login_bloc.dart';

abstract class LoginState
    with BaseState
    implements Built<LoginState, LoginStateBuilder> {
  bool get passwordVisible;

  LoginState._();

  factory LoginState([void Function(LoginStateBuilder) updates]) = _$LoginState;

  factory LoginState.initial() => LoginState((b) => b
    ..isLoading = false
    ..error = false
    ..errorMessage = ''
    ..passwordVisible = true);
}
