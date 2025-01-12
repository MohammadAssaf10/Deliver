import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/widget/app_text_button.dart';
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
                  Text(
                    S.of(context).readyThenLetsRoll,
                    style: TextStyles.font18DarkGreyBold,
                    maxLines: 1,
                  ),
                  AppTextButton(
                    onPressed: null,
                    buttonText: S.of(context).rideWithDeliver,
                    buttonWidth: 135,
                    buttonHeight: 0,
                    borderRadius: 50,
                    textStyle: TextStyles.font12LightGreyBold,
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
