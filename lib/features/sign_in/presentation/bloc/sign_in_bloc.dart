import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_functions.dart';
import '../../data/models/sign_in_request.dart';
import '../../domain/repositories/sign_in_repository.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final SignInRepository _signInRepository;

  void changePasswordVisibility() {
    add(ChangePasswordVisibility());
  }

  void signIn() {
    add(SignIn());
  }

  @override
  Future<void> close() {
    phoneNumberController.dispose();
    passwordController.dispose();
    return super.close();
  }

  SignInBloc(
    this._signInRepository,
  ) : super(SignInState.initial()) {
    on<SignIn>(
      (event, emit) async {
        emit(state.rebuild(
          (b) => b
            ..isLoading = true
            ..isError = false,
        ));
        final SignInRequest signInRequest = SignInRequest(
          phoneNumber: phoneNumberController.text,
          password: passwordController.text,
        );
        final result = await _signInRepository.signIn(signInRequest);
        result.fold((failure) {
          showToastMessage(
            failure.errorMessage,
            isError: true,
          );
          emit(state.rebuild(
            (b) => b
              ..isError = true
              ..isLoading = false
              ..isSuccess = false,
          ));
        }, (data) {
          emit(state.rebuild(
            (b) => b
              ..isError = false
              ..isLoading = false
              ..isSuccess = true
              ..isPhoneNumberVerified = data,
          ));
        });
      },
      transformer: droppable(),
    );
    on<ChangePasswordVisibility>((event, emit) {
      emit(
        state.rebuild((b) => b..passwordVisible = !state.passwordVisible),
      );
    });
  }
}
