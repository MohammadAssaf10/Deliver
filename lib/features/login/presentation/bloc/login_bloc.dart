import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/login_request.dart';
import '../../domain/repositories/login_repository.dart';
import 'login.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final LoginRepository _loginRepository;

  void clearError() {
    add(ClearError());
  }

  void changePasswordVisibility() {
    add(ChangePasswordVisibility());
  }

  void login() {
    add(Login());
  }

  LoginBloc(
    this._loginRepository,
  ) : super(LoginState.initial()) {
    on<Login>(
      (event, emit) async {
        emit(state.rebuild((b) => b..isLoading = true));
        final LoginRequest loginRequest = LoginRequest(
          phoneNumber: phoneNumberController.text,
          password: passwordController.text,
        );
        final result = await _loginRepository.login(loginRequest);
        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
              ..error = true
              ..message = failure.message
              ..isLoading = false
              ..isLogin = false,
          ));
        }, (_) {
          emit(state.rebuild(
            (b) => b
              ..error = false
              ..message = ''
              ..isLoading = false
              ..isLogin = true,
          ));
        });
      },
      // ignore any events added while an event is processing
      transformer: droppable(),
    );
    on<ChangePasswordVisibility>((event, emit) {
      emit(
        state.rebuild(
          (b) => b
            ..passwordVisible = !state.passwordVisible
            ..error = false
            ..message = '',
        ),
      );
    });
    on<ClearError>((event, emit) {
      emit(
        state.rebuild(
          (b) => b
            ..error = false
            ..message = '',
        ),
      );
    });
  }
}
