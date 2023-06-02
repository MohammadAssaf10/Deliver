import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:built_value/built_value.dart';

import '../../../../core/bloc/base_state.dart';
import '../../data/models/login_request.dart';
import '../../domain/use_cases/login.dart';

part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.g.dart';

@lazySingleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  void changePasswordState() {
    add(ChangePasswordState());
  }

  void login(LoginRequest loginRequest) {
    add(Login((b) => b..loginRequest = loginRequest));
  }

  LoginBloc(this._loginUseCase) : super(LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      if (event is ChangePasswordState) {
        emit(state.rebuild((b) => b..passwordVisible = !state.passwordVisible));
      } else if (event is Login) {
        emit(
          state.rebuild((b) => b
            ..isLoading = true
            ..error = false
            ..errorMessage = ''),
        );
        final result = await _loginUseCase(event.loginRequest);
        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
              ..error = true
              ..errorMessage = failure.message
              ..isLoading = false
              ..isLogin = false,
          ));
        }, (r) {
          emit(state.rebuild(
            (b) => b
              ..error = false
              ..errorMessage = ''
              ..isLoading = false
              ..isLogin = true,
          ));
        });
      }
    });
  }
}
