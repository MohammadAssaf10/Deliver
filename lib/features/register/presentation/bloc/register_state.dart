import 'package:built_value/built_value.dart';

part 'register_state.g.dart';

abstract class RegisterState
    implements Built<RegisterState, RegisterStateBuilder> {
  bool get passwordVisible;

  bool get isLoading;

  bool get isError;

  bool get isSuccess;

  RegisterState._();

  factory RegisterState([void Function(RegisterStateBuilder) updates]) =
      _$RegisterState;

  factory RegisterState.initial() => RegisterState(
        (b) => b
          ..isLoading = false
          ..isError = false
          ..isSuccess = false
          ..passwordVisible = true,
      );
}
