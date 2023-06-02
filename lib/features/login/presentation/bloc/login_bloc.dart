import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:built_value/built_value.dart';

import '../../../../core/bloc/base_state.dart';

part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.g.dart';

@lazySingleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  void changePasswordState() {
    add(ChangePasswordState());
  }

  LoginBloc() : super(LoginState.initial()) {
    on<LoginEvent>((event, emit) {
      if (event is ChangePasswordState) {
        emit(state.rebuild((b) => b..passwordVisible = !state.passwordVisible));
      }
    });
  }
}
