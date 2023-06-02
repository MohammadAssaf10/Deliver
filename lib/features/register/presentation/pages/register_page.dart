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
import '../../../../core/widget/loader.dart';
import '../../../../core/widget/select_language.dart';
import '../../../../generated/l10n.dart';
import '../../../login/presentation/widgets/or_bar.dart';
import '../../data/models/register_request.dart';
import '../bloc/register_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = getIt<RegisterBloc>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController mobileNumberController =
        TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<RegisterBloc, RegisterState>(
      bloc: registerBloc,
      listener: (context, state) {
        if (state.error) {
          showCustomToast(
              context: context,
              toastMessage: state.errorMessage,
              isError: state.error);
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
                      key: formKey,
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
                              style: getBoldStyle(
                                fontSize: 30,
                                color: ColorManager.primary,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              S.of(context).registerYourAccount,
                              textAlign: TextAlign.center,
                              style: getSemiBoldStyle(
                                fontSize: 16,
                                color: ColorManager.grey,
                              ),
                            ),
                            const SizedBox(height: 30),
                            CustomTextField(
                              controller: emailController,
                              labelTitle: S.of(context).email,
                              validator: (email) => emailValidator(email),
                              prefixIcon: Icons.email,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            CustomTextField(
                              controller: usernameController,
                              labelTitle: S.of(context).userName,
                              validator: (userName) =>
                                  usernameValidator(userName),
                              prefixIcon: Icons.person,
                            ),
                            CustomTextField(
                              controller: mobileNumberController,
                              labelTitle: S.of(context).mobileNumber,
                              validator: (mobileNumber) =>
                                  mobileNumberValidator(mobileNumber),
                              prefixIcon: Icons.call,
                              keyboardType: TextInputType.phone,
                            ),
                            CustomTextField(
                              obscureText: state.passwordVisible,
                              controller: passwordController,
                              labelTitle: S.of(context).password,
                              validator: (password) =>
                                  passwordValidator(password),
                              prefixIcon: Icons.password,
                              suffixIcon: state.passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              suffixIconAction: () {
                                registerBloc.changePasswordState();
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomDecoratedBox(
                              child: CustomButton(
                                onPress: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  if (formKey.currentState!.validate()) {
                                    final RegisterRequest registerRequest =
                                        RegisterRequest(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            phoneNumber:
                                                mobileNumberController.text,
                                            username: usernameController.text);
                                    registerBloc.register(registerRequest);
                                  }
                                },
                                title: S.of(context).register,
                                titleColor: ColorManager.white,
                              ),
                            ),
                            const OrBar(),
                            AuthOptionText(
                              title: S.of(context).haveAnAccount,
                              subTitle: S.of(context).login,
                              subTitleOnPress: () {
                                GoRouter.of(context).pop();
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
              // state.isLoading ? Loader() : Text(''),
            ],
          ),
        );
      },
    );
  }
}
