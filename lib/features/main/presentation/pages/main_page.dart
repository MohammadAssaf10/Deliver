import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../generated/l10n.dart';
import '../bloc/main_bloc.dart';
import '../widgets/main_bottom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Container(
            margin: const EdgeInsetsDirectional.only(
              start: 15,
              end: 15,
              bottom: 15,
            ),
            alignment: AlignmentDirectional.centerStart,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: ColorsManager.darkWhite),
              ),
            ),
            child: Text(
              S.of(context).deliver,
              style: TextStyles.font33DarkWhiteBold,
            ),
          ),
        ),
      ),
      body: PageView(
        controller: context.read<MainBloc>().pageController,
        children: context.read<MainBloc>().pages,
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
