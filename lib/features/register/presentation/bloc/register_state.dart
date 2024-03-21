import 'package:built_value/built_value.dart';

import '../../../../core/bloc/base_state.dart';

part 'register_state.g.dart';

abstract class RegisterState
    with BaseState
    implements Built<RegisterState, RegisterStateBuilder> {
  bool get passwordVisible;

  bool get isRegister;

  RegisterState._();

  factory RegisterState([void Function(RegisterStateBuilder) updates]) =
      _$RegisterState;

  factory RegisterState.initial() => RegisterState(
        (b) => b
          ..isLoading = false
          ..error = false
          ..message = ''
          ..passwordVisible = true
          ..isRegister = false,
      );
}
