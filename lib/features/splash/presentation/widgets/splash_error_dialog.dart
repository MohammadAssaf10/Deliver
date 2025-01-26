import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_extensions.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../generated/l10n.dart';
import '../bloc/splash_bloc.dart';

class SplashErrorDialog extends StatelessWidget {
  final String errorMessage;

  const SplashErrorDialog({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
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
                errorMessage,
                style: TextStyles.font18BlackBold,
              ),
            ),
            AppTextButton(
              onPressed: () {
                context.pop();
                context.read<SplashBloc>().checkUserAuthentication();
              },
              buttonHeight: 45,
              buttonWidth: MediaQuery.sizeOf(context).width * 0.6,
              buttonText: S.of(context).retry,
              textStyle: TextStyles.font16WhiteRegular,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
