import 'package:built_value/built_value.dart';

part 'verification_code_state.g.dart';

abstract class VerificationCodeState
    implements Built<VerificationCodeState, VerificationCodeStateBuilder> {
  bool get isLoading;

  bool get isSuccess;

  bool get isError;

  VerificationCodeState._();

  factory VerificationCodeState(
          [void Function(VerificationCodeStateBuilder) updates]) =
      _$VerificationCodeState;

  factory VerificationCodeState.initial() => VerificationCodeState((b) => b
    ..isLoading = false
    ..isError = false
    ..isSuccess = false);
}
