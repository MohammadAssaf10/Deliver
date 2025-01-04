import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../generated/l10n.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.customWhite,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.isError) {
            showDialog(
              context: context,
              builder: (_) {
                return BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15,
                  ),
                  child: Dialog(
                    elevation: 0,
                    backgroundColor: ColorsManager.customWhite,
                    insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                    shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            S.of(context).somethingWentWrong,
                            style: TextStyles.font18BlackBold,
                          ),
                        ),
                        AppTextButton(
                          onPressed: () {
                            context.pop();
                            context
                                .read<SplashBloc>()
                                .checkUserAuthentication();
                          },
                          borderSideWidth: 0,
                          buttonHeight: 45,
                          buttonWidth: MediaQuery.sizeOf(context).width * 0.6,
                          buttonText: "Retry",
                          textStyle: TextStyles.font16WhiteRegular,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state.isAuth == true && state.isTokenUpToDate) {
            context.pushReplacementNamed(Routes.mainPage);
          } else if (state.isAuth == false && state.isTokenUpToDate) {
            context.pushReplacementNamed(Routes.onBoardingPage);
          }
        },
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Deliver",
                style: TextStyles.font40BlackBoldItalic,
              ),
              SizedBox(height: 10),
              SpinKitThreeBounce(
                color: ColorsManager.darkGrey,
                size: 19,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
