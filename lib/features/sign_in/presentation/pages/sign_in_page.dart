import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../../core/widget/auth_option_text.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../../../../core/widget/select_language.dart';
import '../../../../generated/l10n.dart';
import '../bloc/sign_in_bloc.dart';
import '../bloc/sign_in_state.dart';
import '../../../../core/widget/or_bar.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.isError) {
          closeLoadingDialogIfVisible();
        }
        if (state.isSuccess && state.isPhoneNumberVerified) {
          context.pushNamedAndRemoveUntil(
            Routes.mainPage,
            predicate: (_) => false,
          );
        } else if (state.isSuccess && !state.isPhoneNumberVerified) {
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
              key: context.read<SignInBloc>().formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Spacer(),
                  Text(
                    S.of(context).welcomeBack,
                    textAlign: TextAlign.center,
                    style: TextStyles.font24BlackBold,
                  ),
                  Text(
                    S.of(context).enterYourAccountDetailsHere,
                    textAlign: TextAlign.center,
                    style: TextStyles.font16GreyRegular,
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
                    buttonText: S.of(context).signIn,
                    textStyle: TextStyles.font14WhiteRegular,
                    borderRadius: 10,
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
                  const Expanded(child: SelectLanguage()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
