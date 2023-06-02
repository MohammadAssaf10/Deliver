part of 'register_bloc.dart';

abstract class RegisterEvent {}

abstract class ChangePasswordState extends RegisterEvent
    implements Built<ChangePasswordState, ChangePasswordStateBuilder> {
  ChangePasswordState._();

  factory ChangePasswordState(
          [void Function(ChangePasswordStateBuilder) updates]) =
      _$ChangePasswordState;
}
