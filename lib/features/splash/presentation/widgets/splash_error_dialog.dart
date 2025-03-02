import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
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
              child: CustomAutoSizeText(
                text: errorMessage,
                minFontSize: 16,
                initialFontSize: 18,
                maxFontSize: 20,
                fontWeight: FontWeightHelper.bold,
                color: ColorsManager.darkGrey,
              ),
            ),
            AppTextButton(
              onPressed: () {
                context.pop();
                context.read<SplashBloc>().checkUserAuthentication();
              },
              buttonHeight: 45,
              buttonWidth: MediaQuery.sizeOf(context).width * 0.6,
              child: CustomAutoSizeText(
                text: S.of(context).retry,
                minFontSize: 14,
                initialFontSize: 16,
                maxFontSize: 18,
                color: ColorsManager.white,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
