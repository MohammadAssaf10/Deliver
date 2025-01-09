import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_functions.dart';
import '../../domain/repositories/verification_code_repository.dart';
import 'verification_code_event.dart';
import 'verification_code_state.dart';

@injectable
class VerificationCodeBloc
    extends Bloc<VerificationCodeEvent, VerificationCodeState> {
  final TextEditingController verificationCodeController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final VerificationCodeRepository _verificationCodeRepository;

  void generateVerificationCode() {
    add(GenerateVerificationCode());
  }

  void verifyPhoneNumber() {
    add(VerifyPhoneNumber());
  }

  @override
  Future<void> close() {
    verificationCodeController.dispose();
    return super.close();
  }

  VerificationCodeBloc(
    this._verificationCodeRepository,
  ) : super(VerificationCodeState.initial()) {
    on<GenerateVerificationCode>((event, emit) async {
      final result =
          await _verificationCodeRepository.generateVerificationCode();
      result.fold((failure) {
        showToastMessage(
          failure.errorMessage,
          isError: true,
        );
      }, (_) {
        add(GetVerificationCode());
      });
    });

    on<GetVerificationCode>((event, emit) async {
      final result = await _verificationCodeRepository.getVerificationCode();
      await result.fold((failure) {
        showToastMessage(
          failure.errorMessage,
          isError: true,
        );
      }, (data) async {
        await Future.delayed(const Duration(seconds: 1));
        verificationCodeController.text = data;
      });
    });

    on<VerifyPhoneNumber>((event, emit) async {
      emit(state.rebuild(
        (b) => b
          ..isSuccess = false
          ..isLoading = true
          ..isError = false,
      ));
      final result = await _verificationCodeRepository
          .verifyPhoneNumber(verificationCodeController.text);
      result.fold((failure) {
        showToastMessage(
          failure.errorMessage,
          isError: true,
        );
        emit(state.rebuild(
          (b) => b
            ..isSuccess = false
            ..isLoading = false
            ..isError = true,
        ));
      }, (_) {
        emit(state.rebuild(
          (b) => b
            ..isSuccess = true
            ..isLoading = false
            ..isError = false,
        ));
      });
    });
  }
}
