import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/color_manager.dart';
import '../../../../config/styles_manager.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/widget/app_name.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_decorated_box.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../../../../core/widget/auth_option_text.dart';
import '../../../../core/widget/select_language.dart';
import '../../../../generated/l10n.dart';
import '../bloc/login_bloc.dart';
import '../widgets/or_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = getIt<LoginBloc>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: loginBloc,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
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
                        style: getBoldStyle(
                          fontSize: 30,
                          color: ColorManager.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        S.of(context).signInToYourAccount,
                        textAlign: TextAlign.center,
                        style: getSemiBoldStyle(
                          fontSize: 16,
                          color: ColorManager.grey,
                        ),
                      ),
                      const SizedBox(height: 80),
                      CustomTextField(
                        controller: emailController,
                        labelTitle: S.of(context).email,
                        validator: (email) => emailValidator(email),
                        prefixIcon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      CustomTextField(
                        obscureText: state.passwordVisible,
                        controller: passwordController,
                        labelTitle: S.of(context).password,
                        validator: (password) => passwordValidator(password),
                        prefixIcon: Icons.password,
                        suffixIcon: state.passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        suffixIconAction: () {
                          loginBloc.changePasswordState();
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomDecoratedBox(
                        child: CustomButton(
                          onPress: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (formKey.currentState!.validate()) {
                              print("Done");
                            }
                          },
                          title: S.of(context).login,
                          titleColor: ColorManager.white,
                        ),
                      ),
                      const OrBar(),
                      AuthOptionText(
                        title: S.of(context).doNotHaveAnAccount,
                        subTitle: S.of(context).register,
                        subTitleOnPress: () {
                          GoRouter.of(context).pushNamed("register");
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
        );
      },
    );
  }
}
