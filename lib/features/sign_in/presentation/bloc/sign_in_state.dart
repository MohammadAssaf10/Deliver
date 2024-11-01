import 'package:built_value/built_value.dart';

part 'sign_in_state.g.dart';

abstract class SignInState implements Built<SignInState, SignInStateBuilder> {
  bool get passwordVisible;

  bool get isLoading;

  bool get isSuccess;

  bool get isError;

  bool get isPhoneNumberVerified;

  SignInState._();

  factory SignInState([void Function(SignInStateBuilder) updates]) =
      _$SignInState;

  factory SignInState.initial() => SignInState(
        (b) => b
          ..isLoading = false
          ..isError = false
          ..isSuccess = false
          ..passwordVisible = true
          ..isPhoneNumberVerified = false,
      );
}
