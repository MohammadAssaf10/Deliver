import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
import '../../../../generated/l10n.dart';

class GetStartContainer extends StatelessWidget {
  final double? height;

  const GetStartContainer({
    super.key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsetsDirectional.all(20),
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: CustomAutoSizeText(
              text: S.of(context).getStartWithDeliver,
              minFontSize: 26,
              initialFontSize: 28,
              maxFontSize: 30,
              color: ColorsManager.darkGrey,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          Flexible(
            child: AppTextButton(
              onPressed: () {
                context.pushNamed(Routes.signInPage);
              },
              child: Row(
                children: [
                  const SizedBox(width: 30),
                  Expanded(
                    child: CustomAutoSizeText(
                      text: S.of(context).continue1,
                      minFontSize: 18,
                      initialFontSize: 20,
                      maxFontSize: 22,
                      color: ColorsManager.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_sharp,
                    color: ColorsManager.white,
                    weight: 30,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
