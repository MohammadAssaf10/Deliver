import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widget/app_name.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_decorated_box.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../../../../core/widget/auth_option_text.dart';
import '../../../../core/widget/loader.dart';
import '../../../../core/widget/select_language.dart';
import '../../../../generated/l10n.dart';
import '../../../login/presentation/widgets/or_bar.dart';
import '../bloc/register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.error) {
          showCustomToast(
            context: context,
            toastMessage: state.message,
            isError: state.error,
          );
          context.read<RegisterBloc>().clearError();
        }
        if (state.isRegister) {
          context.pushNamedAndRemoveUntil(
            Routes.homePage,
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
                              style: TextStyles.font30PrimaryBold,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              S.of(context).registerYourAccount,
                              textAlign: TextAlign.center,
                              style: TextStyles.font16GreyBold,
                            ),
                            const SizedBox(height: 30),
                            CustomTextField(
                              controller:
                                  context.read<RegisterBloc>().emailController,
                              labelTitle: S.of(context).email,
                              validator: (email) => null,
                              prefixIcon: Icons.email,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            CustomTextField(
                              controller: context
                                  .read<RegisterBloc>()
                                  .usernameController,
                              labelTitle: S.of(context).userName,
                              validator: (userName) =>
                                  usernameValidator(userName),
                              prefixIcon: Icons.person,
                            ),
                            CustomTextField(
                              controller: context
                                  .read<RegisterBloc>()
                                  .mobileNumberController,
                              labelTitle: S.of(context).mobileNumber,
                              validator: (mobileNumber) =>
                                  mobileNumberValidator(mobileNumber),
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
                                  passwordValidator(password),
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
                            CustomDecoratedBox(
                              child: CustomButton(
                                onPress: () {
                                  if (context
                                      .read<RegisterBloc>()
                                      .formKey
                                      .currentState!
                                      .validate()) {
                                    context.read<RegisterBloc>().register();
                                  }
                                },
                                title: S.of(context).register,
                                titleColor: ColorsManager.white,
                              ),
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
