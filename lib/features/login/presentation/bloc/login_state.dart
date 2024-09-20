import 'package:built_value/built_value.dart';

import '../../../../core/utils/base_bloc_state.dart';

part 'login_state.g.dart';

abstract class LoginState
    with BaseState
    implements Built<LoginState, LoginStateBuilder> {
  bool get passwordVisible;

  LoginState._();

  factory LoginState([void Function(LoginStateBuilder) updates]) = _$LoginState;

  factory LoginState.initial() => LoginState(
        (b) => b
          ..isLoading = false
          ..isError = false
          ..isSuccess = false
          ..message = ''
          ..passwordVisible = true,
      );
}
