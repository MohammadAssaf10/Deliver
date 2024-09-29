import 'package:built_value/built_value.dart';

part 'sign_up_event.g.dart';

abstract class SignUpEvent {}

abstract class ChangePasswordState extends SignUpEvent
    implements Built<ChangePasswordState, ChangePasswordStateBuilder> {
  ChangePasswordState._();

  factory ChangePasswordState(
          [void Function(ChangePasswordStateBuilder) updates]) =
      _$ChangePasswordState;
}

abstract class SignUp extends SignUpEvent
    implements Built<SignUp, SignUpBuilder> {
  SignUp._();

  factory SignUp([void Function(SignUpBuilder) updates]) = _$SignUp;
}
