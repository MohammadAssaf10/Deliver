import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/presentation/bloc/app_cubit.dart';
import '../../app/presentation/bloc/app_state.dart';
import '../../generated/l10n.dart';
import '../theming/styles_manager.dart';
import '../utils/app_enums.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    context.read<AppCubit>().changeAppLanguage();
                  },
                  child: Text(
                    S.of(context).arabic,
                    textAlign: TextAlign.end,
                    style: state.appLanguage == Language.ar
                        ? TextStyles.font14BlackBold
                        : TextStyles.font14GreyRegular,
                  ),
                ),
              ),
              Text(
                " / ",
                style: TextStyles.font14BlackBold,
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    context.read<AppCubit>().changeAppLanguage();
                  },
                  child: Text(
                    S.of(context).english,
                    style: state.appLanguage == Language.en
                        ? TextStyles.font14BlackBold
                        : TextStyles.font14GreyRegular,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
