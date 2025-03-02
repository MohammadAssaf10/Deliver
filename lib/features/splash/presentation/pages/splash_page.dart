import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_state.dart';
import '../widgets/splash_error_dialog.dart';

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
                return BlocProvider.value(
                  value: context.read<SplashBloc>(),
                  child: SplashErrorDialog(errorMessage: state.errorMessage),
                );
              },
            );
          } else if (state.isAuth == true) {
            context.pushReplacementNamed(Routes.mainPage);
          } else if (state.isAuth == false) {
            context.pushReplacementNamed(Routes.onBoardingPage);
          }
        },
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAutoSizeText(
                text: "Deliver",
                minFontSize: 38,
                initialFontSize: 40,
                maxFontSize: 42,
                color: ColorsManager.darkGrey,
                fontWeight: FontWeightHelper.bold,
                fontStyle: FontStyle.italic,
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
