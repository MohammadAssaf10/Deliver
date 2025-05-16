import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../generated/assets.dart';
import '../widgets/get_start_container.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.customWhite,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Column(
              children: [
                Expanded(
                  flex: orientation == Orientation.landscape ? 1 : 4,
                  child: Image.asset(
                    Assets.imagesOnBoarding,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                if (orientation == Orientation.portrait)
                  const Expanded(
                    child: GetStartContainer(),
                  ),
                if (orientation == Orientation.landscape)
                  GetStartContainer(
                    height: MediaQuery.sizeOf(context).height * 0.27,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
