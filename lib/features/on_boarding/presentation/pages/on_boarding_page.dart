import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Image.asset(
                  Assets.imagesOnBoarding,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsetsDirectional.all(20),
                  alignment: AlignmentDirectional.centerStart,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          S.of(context).getStartWithDeliver,
                          style: TextStyles.font30BlackBold,
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
                                child: Text(
                                  S.of(context).continue1,
                                  style: TextStyles.font20WhiteRegular,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
