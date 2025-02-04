import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../theming/colors_manager.dart';
import '../theming/font_manager.dart';
import 'app_text_button.dart';
import 'custom_auto_size_text.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onRetry;

  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon to visually indicate an error
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red.withValues(alpha: 0.7),
            ),
            const SizedBox(height: 16),

            // Error message
            CustomAutoSizeText(
              text: errorMessage,
              minFontSize: 16,
              initialFontSize: 18,
              maxFontSize: 20,
              color: ColorsManager.darkWhite,
              textAlign: TextAlign.center,
              fontWeight: FontWeightHelper.medium,
            ),

            const SizedBox(height: 20),

            // Retry button (optional)
            if (onRetry != null)
              AppTextButton(
                onPressed: onRetry,
                backgroundColor: ColorsManager.darkWhite,
                buttonWidth: MediaQuery.sizeOf(context).width * 0.3,
                buttonHeight: 45,
                borderRadius: 15,
                child: CustomAutoSizeText(
                  text: S.of(context).retry,
                  minFontSize: 14,
                  initialFontSize: 16,
                  maxFontSize: 18,
                  color: ColorsManager.darkGrey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
