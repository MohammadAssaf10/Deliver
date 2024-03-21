import 'package:built_value/built_value.dart';

import '../../data/models/register_request.dart';

part 'register_event.g.dart';

abstract class RegisterEvent {}

abstract class ChangePasswordState extends RegisterEvent
    implements Built<ChangePasswordState, ChangePasswordStateBuilder> {
  ChangePasswordState._();

  factory ChangePasswordState(
          [void Function(ChangePasswordStateBuilder) updates]) =
      _$ChangePasswordState;
}

abstract class Register extends RegisterEvent
    implements Built<Register, RegisterBuilder> {
  Register._();

  factory Register([void Function(RegisterBuilder) updates]) = _$Register;
}

abstract class ClearError extends RegisterEvent
    implements Built<ClearError, ClearErrorBuilder> {
  ClearError._();

  factory ClearError([void Function(ClearErrorBuilder) updates]) = _$ClearError;
}
