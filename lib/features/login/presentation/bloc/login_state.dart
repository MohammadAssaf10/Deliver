import 'package:built_value/built_value.dart';

import '../../../../core/bloc/base_state.dart';

part 'login_state.g.dart';

abstract class LoginState
    with BaseState
    implements Built<LoginState, LoginStateBuilder> {
  bool get passwordVisible;

  bool get isLogin;

  LoginState._();

  factory LoginState([void Function(LoginStateBuilder) updates]) = _$LoginState;

  factory LoginState.initial() => LoginState(
        (b) => b
          ..isLoading = false
          ..error = false
          ..message = ''
          ..passwordVisible = true
          ..isLogin = false,
      );
}
