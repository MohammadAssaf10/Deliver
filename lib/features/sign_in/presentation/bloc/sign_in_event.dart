import 'package:built_value/built_value.dart';

part 'sign_in_event.g.dart';

abstract class SignInEvent {}

abstract class ChangePasswordVisibility extends SignInEvent
    implements
        Built<ChangePasswordVisibility, ChangePasswordVisibilityBuilder> {
  ChangePasswordVisibility._();

  factory ChangePasswordVisibility(
          [void Function(ChangePasswordVisibilityBuilder) updates]) =
      _$ChangePasswordVisibility;
}

abstract class SignIn extends SignInEvent
    implements Built<SignIn, SignInBuilder> {
  SignIn._();

  factory SignIn([void Function(SignInBuilder) updates]) = _$SignIn;
}
