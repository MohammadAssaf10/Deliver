import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class LetsRollCard extends StatelessWidget {
  const LetsRollCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.mapPage);
      },
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: ColorsManager.customPurple,
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(vertical: 25),
        padding: const EdgeInsetsDirectional.only(start: 14),
        child: Row(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.54,
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAutoSizeText(
                    text: S.of(context).readyThenLetsRoll,
                    minFontSize: 16,
                    initialFontSize: 18,
                    maxFontSize: 20,
                    color: ColorsManager.darkGrey,
                    fontWeight: FontWeightHelper.bold,
                    maxLines: 1,
                  ),
                  AppTextButton(
                    onPressed: null,
                    buttonWidth: 135,
                    buttonHeight: 0,
                    borderRadius: 50,
                    child: CustomAutoSizeText(
                      text: S.of(context).rideWithDeliver,
                      minFontSize: 10,
                      initialFontSize: 12,
                      maxFontSize: 14,
                      color: ColorsManager.lightGrey,
                      fontWeight: FontWeightHelper.bold,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                Assets.imagesPickupImage,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
