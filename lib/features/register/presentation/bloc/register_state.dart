part of 'register_bloc.dart';

abstract class RegisterState
    with BaseState
    implements Built<RegisterState, RegisterStateBuilder> {
  bool get passwordVisible;

  bool get isRegister;

  RegisterState._();

  factory RegisterState([void Function(RegisterStateBuilder) updates]) =
      _$RegisterState;

  factory RegisterState.initial() => RegisterState((b) => b
    ..isLoading = false
    ..error = false
    ..errorMessage = ''
    ..passwordVisible = true
    ..isRegister = false);
}
