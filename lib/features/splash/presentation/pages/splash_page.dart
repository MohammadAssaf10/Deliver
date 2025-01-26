import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/utils/app_extensions.dart';
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
