import 'package:built_value/built_value.dart';

part 'sign_up_state.g.dart';

abstract class SignUpState implements Built<SignUpState, SignUpStateBuilder> {
  bool get passwordVisible;

  bool get isLoading;

  bool get isError;

  bool get isSuccess;

  SignUpState._();

  factory SignUpState([void Function(SignUpStateBuilder) updates]) =
      _$SignUpState;

  factory SignUpState.initial() => SignUpState(
        (b) => b
          ..isLoading = false
          ..isError = false
          ..isSuccess = false
          ..passwordVisible = true,
      );
}
