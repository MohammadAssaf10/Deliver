import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/widget/app_name.dart';
import '../../../../core/widget/auth_option_text.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_decorated_box.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../../../../core/widget/select_language.dart';
import '../../../../generated/l10n.dart';
import '../bloc/login.dart';
import '../widgets/or_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.error) {
          dismissDialog(context);
          showCustomToast(
            toastMessage: state.message,
            isError: state.error,
          );
          context.read<LoginBloc>().clearError();
        }
        if (state.isLogin) {
          context.pushNamedAndRemoveUntil(
            Routes.homePage,
            predicate: (_) => false,
          );
        }
        if (state.isLoading) {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Animate(
            effects: const [
              FadeEffect(
                duration: Duration(milliseconds: 250),
              ),
            ],
            child: Form(
              key: context.read<LoginBloc>().formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height / 10),
                    const AppName(),
                    const SizedBox(height: 40),
                    Text(
                      S.of(context).login,
                      textAlign: TextAlign.center,
                      style: TextStyles.font30PrimaryBold,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      S.of(context).signInToYourAccount,
                      textAlign: TextAlign.center,
                      style: TextStyles.font16GreyBold,
                    ),
                    const SizedBox(height: 80),
                    CustomTextField(
                      controller:
                          context.read<LoginBloc>().phoneNumberController,
                      labelTitle: S.of(context).email,
                      validator: (_) => null,
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return CustomTextField(
                          obscureText: state.passwordVisible,
                          controller:
                              context.read<LoginBloc>().passwordController,
                          labelTitle: S.of(context).password,
                          validator: passwordValidator,
                          prefixIcon: Icons.password,
                          suffixIcon: state.passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          suffixIconAction: () {
                            context
                                .read<LoginBloc>()
                                .changePasswordVisibility();
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomDecoratedBox(
                      child: CustomButton(
                        onPress: () {
                          if (context
                              .read<LoginBloc>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context.read<LoginBloc>().login();
                          }
                        },
                        title: S.of(context).login,
                        titleColor: ColorsManager.white,
                      ),
                    ),
                    const OrBar(),
                    AuthOptionText(
                      title: S.of(context).doNotHaveAnAccount,
                      subTitle: S.of(context).register,
                      subTitleOnPress: () {
                        context.pushNamed(Routes.registerPage);
                        context.read<LoginBloc>().phoneNumberController.clear();
                        context.read<LoginBloc>().passwordController.clear();
                      },
                    ),
                    const SizedBox(height: 80),
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
