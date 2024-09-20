import 'package:built_value/built_value.dart';

import '../../../../core/utils/base_bloc_state.dart';

part 'register_state.g.dart';

abstract class RegisterState
    with BaseState
    implements Built<RegisterState, RegisterStateBuilder> {
  bool get passwordVisible;

  RegisterState._();

  factory RegisterState([void Function(RegisterStateBuilder) updates]) =
      _$RegisterState;

  factory RegisterState.initial() => RegisterState((b) => b
    ..isLoading = false
    ..isError = false
    ..isSuccess = false
    ..message = ''
    ..passwordVisible = true);
}
