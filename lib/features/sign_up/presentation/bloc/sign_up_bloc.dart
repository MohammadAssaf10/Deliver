import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_functions.dart';
import '../../data/models/sign_up_request.dart';
import '../../domain/repositories/sign_up_repository.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepository _signUpRepository;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changePasswordState() {
    add(ChangePasswordState());
  }

  void signUp() {
    add(SignUp());
  }

  SignUpBloc(
    this._signUpRepository,
  ) : super(SignUpState.initial()) {
    on<ChangePasswordState>((event, emit) async {
      emit(
        state.rebuild((b) => b..passwordVisible = !state.passwordVisible),
      );
    });
    on<SignUp>(
      (event, emit) async {
        emit(state.rebuild(
          (b) => b
            ..isLoading = true
            ..isError = false,
        ));
        final SignUpRequest signUpRequest = SignUpRequest(
          password: passwordController.text,
          phoneNumber: mobileNumberController.text,
          username: usernameController.text,
        );
        final result = await _signUpRepository.signUp(signUpRequest);
        result.fold((failure) {
          showCustomToast(
            toastMessage: failure.errorMessage,
            isError: true,
          );
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
      },
      transformer: droppable(),
    );
  }
}
