import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../../core/widget/app_name.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../../../../core/widget/auth_option_text.dart';
import '../../../../core/widget/loader.dart';
import '../../../../core/widget/select_language.dart';
import '../../../../generated/l10n.dart';
import '../../../sign_in/presentation/widgets/or_bar.dart';
import '../bloc/register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isError) {
          // showCustomToast(
          //   toastMessage: state.message,
          //   isError: state.isError,
          // );
          context.read<RegisterBloc>().clearError();
        }
        if (state.isSuccess) {
          context.pushNamedAndRemoveUntil(
            Routes.mainPage,
            predicate: (_) => false,
          );
        }
      },
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state.isLoading,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  body: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: context.read<RegisterBloc>().formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 10),
                            const AppName(),
                            const SizedBox(height: 40),
                            Text(
                              S.of(context).register,
                              textAlign: TextAlign.center,
                              style: TextStyles.font30BlackBold,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              S.of(context).registerYourAccount,
                              textAlign: TextAlign.center,
                              style: TextStyles.font16GreyBold,
                            ),
                            const SizedBox(height: 30),
                            CustomTextField(
                              controller: context
                                  .read<RegisterBloc>()
                                  .usernameController,
                              labelTitle: S.of(context).userName,
                              validator: (userName) =>
                                  AppValidator.usernameValidator(userName),
                              prefixIcon: Icons.person,
                            ),
                            CustomTextField(
                              controller: context
                                  .read<RegisterBloc>()
                                  .mobileNumberController,
                              labelTitle: S.of(context).mobileNumber,
                              validator: (mobileNumber) =>
                                  AppValidator.mobileNumberValidator(
                                      mobileNumber),
                              prefixIcon: Icons.call,
                              keyboardType: TextInputType.phone,
                            ),
                            CustomTextField(
                              obscureText: state.passwordVisible,
                              controller: context
                                  .read<RegisterBloc>()
                                  .passwordController,
                              labelTitle: S.of(context).password,
                              validator: (password) =>
                                  AppValidator.passwordValidator(password),
                              prefixIcon: Icons.password,
                              suffixIcon: state.passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              suffixIconAction: () {
                                context
                                    .read<RegisterBloc>()
                                    .changePasswordState();
                              },
                            ),
                            const SizedBox(height: 10),
                            AppTextButton(
                              onPressed: () {
                                if (context
                                    .read<RegisterBloc>()
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  context.read<RegisterBloc>().register();
                                }
                              },
                              buttonText: S.of(context).register,
                            ),
                            const OrBar(),
                            AuthOptionText(
                              title: S.of(context).haveAnAccount,
                              subTitle: S.of(context).login,
                              subTitleOnPress: () {
                                context.pop();
                              },
                            ),
                            const SizedBox(height: 25),
                            const SelectLanguage(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (state.isLoading) const Loader()
            ],
          ),
        );
      },
    );
  }
}
