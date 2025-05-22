import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/auth_option_text.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../../../../core/widget/or_bar.dart';
import '../../../../core/widget/select_language.dart';
import '../../../../generated/l10n.dart';
import '../bloc/sign_up_bloc.dart';
import '../bloc/sign_up_state.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.isError) {
          closeLoadingDialogIfVisible();
        }
        if (state.isSuccess) {
          closeLoadingDialogIfVisible();
          context.pushNamed(Routes.verificationCodePage);
        }
        if (state.isLoading) {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorsManager.customWhite,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: context.read<SignUpBloc>().formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.24),
                    CustomAutoSizeText(
                      text: S.of(context).registration,
                      textAlign: TextAlign.center,
                      minFontSize: 22,
                      initialFontSize: 24,
                      maxFontSize: 26,
                      color: ColorsManager.darkGrey,
                      fontWeight: FontWeightHelper.bold,
                    ),
                    CustomAutoSizeText(
                      text: S.of(context).kindlySignUpBelow,
                      textAlign: TextAlign.center,
                      minFontSize: 14,
                      initialFontSize: 16,
                      maxFontSize: 18,
                      color: ColorsManager.grey,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: context.read<SignUpBloc>().usernameController,
                      labelTitle: S.of(context).userName,
                      validator: AppValidator.usernameValidator,
                      prefixIcon: Icons.person,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextField(
                      controller:
                          context.read<SignUpBloc>().mobileNumberController,
                      labelTitle: S.of(context).mobileNumber,
                      validator: AppValidator.mobileNumberValidator,
                      prefixIcon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      textInputFormatter: LengthLimitingTextInputFormatter(10),
                    ),
                    BlocBuilder<SignUpBloc, SignUpState>(
                      buildWhen: (previous, current) =>
                          previous.passwordVisible != current.passwordVisible,
                      builder: (context, state) {
                        return CustomTextField(
                          obscureText: state.passwordVisible,
                          controller:
                              context.read<SignUpBloc>().passwordController,
                          labelTitle: S.of(context).password,
                          validator: AppValidator.passwordValidator,
                          prefixIcon: Icons.password,
                          suffixIcon: state.passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          suffixIconAction: () {
                            context.read<SignUpBloc>().changePasswordState();
                          },
                          onFieldSubmitted: (_) {
                            if (context
                                .read<SignUpBloc>()
                                .formKey
                                .currentState!
                                .validate()) {
                              context.read<SignUpBloc>().signUp();
                            }
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    AppTextButton(
                      onPressed: () {
                        if (context
                            .read<SignUpBloc>()
                            .formKey
                            .currentState!
                            .validate()) {
                          context.read<SignUpBloc>().signUp();
                        }
                      },
                      borderRadius: 10,
                      child: CustomAutoSizeText(
                        text: S.of(context).signUp,
                        minFontSize: 12,
                        initialFontSize: 14,
                        maxFontSize: 16,
                        color: ColorsManager.white,
                      ),
                    ),
                    const OrBar(),
                    AuthOptionText(
                      title: S.of(context).alreadyHaveAnAccount,
                      subTitle: S.of(context).loginHere,
                      subTitleOnPress: () {
                        context.pop();
                      },
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                    const SelectLanguage(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
