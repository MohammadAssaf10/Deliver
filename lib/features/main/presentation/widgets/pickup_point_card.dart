import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
import '../../../../generated/l10n.dart';

class PickupPointCard extends StatelessWidget {
  const PickupPointCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.mapPage);
      },
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: ColorsManager.lightBlack,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: ColorsManager.lightGrey,
              size: 40,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: CustomAutoSizeText(
                  text: S.of(context).enterPickupPoint,
                  minFontSize: 10,
                  initialFontSize: 12,
                  maxFontSize: 14,
                  color: ColorsManager.lightGrey,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            Container(
              width: 2,
              height: 45,
              color: ColorsManager.darkGrey,
            ),
            Expanded(
              child: Container(
                height: 38,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: ColorsManager.darkGrey,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time_filled_rounded,
                      color: ColorsManager.lightGrey,
                    ),
                    Expanded(
                      child: Center(
                        child: CustomAutoSizeText(
                          text: S.of(context).now,
                          minFontSize: 10,
                          initialFontSize: 12,
                          maxFontSize: 14,
                          color: ColorsManager.lightGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
