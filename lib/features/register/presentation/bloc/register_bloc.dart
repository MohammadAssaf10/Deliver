import 'package:bloc/bloc.dart';
import 'package:built_value/built_value.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_state.dart';
import '../../data/models/register_request.dart';
import '../../domain/use_cases/register.dart';

part 'register_event.dart';

part 'register_state.dart';

part 'register_bloc.g.dart';

@lazySingleton
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  void changePasswordState() {
    add(ChangePasswordState());
  }

  void register(RegisterRequest registerRequest) {
    add(Register((b) => b..registerRequest = registerRequest));
  }

  RegisterBloc(this._registerUseCase) : super(RegisterState.initial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is ChangePasswordState) {
        emit(state.rebuild((b) => b..passwordVisible = !state.passwordVisible));
      } else if (event is Register) {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = false
          ..errorMessage = ''));
        final result = await _registerUseCase(event.registerRequest);
        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
              ..error = true
              ..errorMessage = failure.message
              ..isLoading = false
              ..isRegister = false,
          ));
        }, (r) {
          emit(state.rebuild(
            (b) => b
              ..error = false
              ..errorMessage = ''
              ..isLoading = false
              ..isRegister = true,
          ));
        });
      }
    });
  }
}
