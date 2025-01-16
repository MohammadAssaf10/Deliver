import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../generated/l10n.dart';
import '../bloc/main_bloc.dart';
import '../bloc/main_state.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          child: BlocBuilder<MainBloc, MainState>(
            buildWhen: (previous, current) =>
                previous.pageIndex != current.pageIndex,
            builder: (context, state) {
              return Text(
                state.pageIndex == 0
                    ? S.of(context).deliver
                    : state.pageIndex == 1
                        ? S.of(context).services
                        : state.pageIndex == 2
                            ? S.of(context).activities
                            : S.of(context).account,
                style: TextStyles.font33DarkWhiteBold,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}
