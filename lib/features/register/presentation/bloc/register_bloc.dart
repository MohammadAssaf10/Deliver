import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/register_request.dart';
import '../../domain/repositories/register_repository.dart';
import 'register.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository _registerRepository;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void clearError() {
    add(ClearError());
  }

  void changePasswordState() {
    add(ChangePasswordState());
  }

  void register() {
    add(Register());
  }

  RegisterBloc(
    this._registerRepository,
  ) : super(RegisterState.initial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is ClearError) {
        emit(state.rebuild((b) => b..isError = false));
      } else if (event is ChangePasswordState) {
        emit(
          state.rebuild((b) => b
            ..passwordVisible = !state.passwordVisible
            ..isError = false),
        );
      } else if (event is Register) {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..isError = false));
        final RegisterRequest registerRequest = RegisterRequest(
          password: passwordController.text,
          phoneNumber: mobileNumberController.text,
          username: usernameController.text,
        );
        final result = await _registerRepository.register(registerRequest);
        result.fold((failure) {
          emit(state.rebuild(
            (b) => b
              ..isError = true
              ..isLoading = false
              ..isSuccess = false,
          ));
        }, (r) {
          emit(state.rebuild(
            (b) => b
              ..isError = false
              ..isLoading = false
              ..isSuccess = true,
          ));
        });
      }
    });
  }
}
