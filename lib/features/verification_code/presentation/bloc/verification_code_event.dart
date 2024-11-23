import 'package:built_value/built_value.dart';

part 'verification_code_event.g.dart';

abstract class VerificationCodeEvent {}

abstract class GenerateVerificationCode extends VerificationCodeEvent
    implements
        Built<GenerateVerificationCode, GenerateVerificationCodeBuilder> {
  GenerateVerificationCode._();

  factory GenerateVerificationCode(
          [void Function(GenerateVerificationCodeBuilder) updates]) =
      _$GenerateVerificationCode;
}

abstract class GetVerificationCode extends VerificationCodeEvent
    implements Built<GetVerificationCode, GetVerificationCodeBuilder> {
  GetVerificationCode._();

  factory GetVerificationCode(
          [void Function(GetVerificationCodeBuilder) updates]) =
      _$GetVerificationCode;
}

abstract class VerifyPhoneNumber extends VerificationCodeEvent
    implements Built<VerifyPhoneNumber, VerifyPhoneNumberBuilder> {
  VerifyPhoneNumber._();

  factory VerifyPhoneNumber([void Function(VerifyPhoneNumberBuilder) updates]) =
      _$VerifyPhoneNumber;
}
