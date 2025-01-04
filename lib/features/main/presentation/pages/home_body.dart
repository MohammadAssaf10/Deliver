import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../generated/assets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
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
                      child: Text(
                        'Enter pickup point',
                        style: TextStyles.font12LightGreyBold,
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
                              child: Text(
                                "Now",
                                style: TextStyles.font12LightGreyRegular,
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
          ),
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: ColorsManager.customPurple,
              borderRadius: BorderRadius.circular(15),
            ),
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
                        "Ready? Then let's roll.",
                        style: TextStyles.font18DarkGreyBold,
                        maxLines: 1,
                      ),
                      AppTextButton(
                        onPressed: () {},
                        buttonText: "Ride with Deliver",
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
