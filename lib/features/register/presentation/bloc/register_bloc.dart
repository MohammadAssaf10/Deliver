import 'package:bloc/bloc.dart';
import 'package:built_value/built_value.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_state.dart';

part 'register_event.dart';

part 'register_state.dart';

part 'register_bloc.g.dart';

@lazySingleton
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  void changePasswordState() {
    add(ChangePasswordState());
  }

  RegisterBloc() : super(RegisterState.initial()) {
    on<RegisterEvent>((event, emit) {
      if (event is ChangePasswordState) {
        emit(state.rebuild((b) => b..passwordVisible = !state.passwordVisible));
      }
    });
  }
}
