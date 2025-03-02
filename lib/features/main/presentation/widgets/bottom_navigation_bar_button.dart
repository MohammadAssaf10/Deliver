import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_manager.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
import '../bloc/main_bloc.dart';
import '../bloc/main_state.dart';

class BottomNavigationBarButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final int index;

  const BottomNavigationBarButton({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MainBloc, MainState>(
        buildWhen: (previous, current) =>
        previous.pageIndex != current.pageIndex,
        builder: (context, state) {
          return GestureDetector(
              onTap: () {
                context.read<MainBloc>().pageController.jumpToPage(index);
              },
              child: Container(
                color: ColorsManager.darkGrey,
                child: Column(
                  children: [
                    Expanded(
                      child: Icon(
                        icon,
                        color: state.pageIndex == index
                            ? ColorsManager.white
                            : ColorsManager.lightGrey,
                        size: state.pageIndex == index ? 29 : 27,
                      ),
                    ),
                    CustomAutoSizeText(
                      text: title,
                      minFontSize: state.pageIndex == index ? 13 : 11,
                      initialFontSize: state.pageIndex == index ? 15 : 13,
                      maxFontSize: state.pageIndex == index ? 17 : 15,
                      color: state.pageIndex == index
                          ? ColorsManager.white
                          : ColorsManager.lightGrey,
                      fontWeight: state.pageIndex == index
                          ? FontWeightHelper.bold
                          : FontWeightHelper.regular,
                    ),
                    const SizedBox(height: 6)
                  ],
                ),
              ));
        },
      ),
    );
  }
}
