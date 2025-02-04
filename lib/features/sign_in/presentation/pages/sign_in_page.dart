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
import '../bloc/sign_in_bloc.dart';
import '../bloc/sign_in_state.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.isSuccess && state.isPhoneNumberVerified) {
          context.pushNamedAndRemoveUntil(
            Routes.mainPage,
            predicate: (_) => false,
          );
        } else if (state.isSuccess && !state.isPhoneNumberVerified) {
          closeLoadingDialogIfVisible();
          context.pushNamed(Routes.verificationCodePage);
        } else if (state.isError) {
          closeLoadingDialogIfVisible();
        } else if (state.isLoading) {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorsManager.customWhite,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: context.read<SignInBloc>().formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.3),
                  CustomAutoSizeText(
                    text: S.of(context).welcomeBack,
                    textAlign: TextAlign.center,
                    minFontSize: 22,
                    initialFontSize: 24,
                    maxFontSize: 26,
                    fontWeight: FontWeightHelper.bold,
                    color: ColorsManager.darkGrey,
                  ),
                  CustomAutoSizeText(
                    text: S.of(context).enterYourAccountDetailsHere,
                    textAlign: TextAlign.center,
                    minFontSize: 14,
                    initialFontSize: 16,
                    maxFontSize: 18,
                    color: ColorsManager.grey,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller:
                        context.read<SignInBloc>().phoneNumberController,
                    labelTitle: S.of(context).mobileNumber,
                    validator: AppValidator.mobileNumberValidator,
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    textInputFormatter: LengthLimitingTextInputFormatter(10),
                  ),
                  BlocBuilder<SignInBloc, SignInState>(
                    buildWhen: (previous, current) =>
                        previous.passwordVisible != current.passwordVisible,
                    builder: (context, state) {
                      return CustomTextField(
                        obscureText: state.passwordVisible,
                        controller:
                            context.read<SignInBloc>().passwordController,
                        labelTitle: S.of(context).password,
                        validator: AppValidator.passwordValidator,
                        prefixIcon: Icons.password,
                        suffixIcon: state.passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        suffixIconAction: () {
                          context.read<SignInBloc>().changePasswordVisibility();
                        },
                        onFieldSubmitted: (_) {
                          if (context
                              .read<SignInBloc>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context.read<SignInBloc>().signIn();
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  AppTextButton(
                    onPressed: () {
                      if (context
                          .read<SignInBloc>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context.read<SignInBloc>().signIn();
                      }
                    },
                    borderRadius: 10,
                    child: CustomAutoSizeText(
                      text: S.of(context).signIn,
                      minFontSize: 12,
                      initialFontSize: 14,
                      maxFontSize: 16,
                      color: ColorsManager.white,
                    ),
                  ),
                  const OrBar(),
                  AuthOptionText(
                    title: S.of(context).doNotHaveAnAccount,
                    subTitle: S.of(context).registerHere,
                    subTitleOnPress: () {
                      context.pushNamed(Routes.signUpPage);
                      context.read<SignInBloc>().phoneNumberController.clear();
                      context.read<SignInBloc>().passwordController.clear();
                    },
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.19),
                  SelectLanguage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
