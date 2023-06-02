part of 'login_bloc.dart';

abstract class LoginEvent {}

abstract class ChangePasswordState extends LoginEvent
    implements Built<ChangePasswordState, ChangePasswordStateBuilder> {
  ChangePasswordState._();

  factory ChangePasswordState(
          [void Function(ChangePasswordStateBuilder) updates]) =
      _$ChangePasswordState;
}
