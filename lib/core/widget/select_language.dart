import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/presentation/bloc/app_cubit.dart';
import '../../app/presentation/bloc/app_state.dart';
import '../../generated/l10n.dart';
import '../theming/colors_manager.dart';
import '../theming/font_manager.dart';
import '../utils/app_enums.dart';
import 'custom_auto_size_text.dart';

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
                  child: CustomAutoSizeText(
                    text: S.of(context).arabic,
                    textAlign: TextAlign.end,
                    minFontSize: 12,
                    initialFontSize: 14,
                    maxFontSize: 16,
                    color: state.appLanguage == Language.ar
                        ? ColorsManager.darkGrey
                        : ColorsManager.grey,
                    fontWeight: state.appLanguage == Language.ar
                        ? FontWeightHelper.bold
                        : FontWeightHelper.regular,
                  ),
                ),
              ),
              CustomAutoSizeText(
                text: ' / ',
                minFontSize: 12,
                initialFontSize: 14,
                maxFontSize: 16,
                color: ColorsManager.darkGrey,
                fontWeight: FontWeightHelper.bold,
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    context.read<AppCubit>().changeAppLanguage();
                  },
                  child: CustomAutoSizeText(
                    text: S.of(context).english,
                    minFontSize: 12,
                    initialFontSize: 14,
                    maxFontSize: 16,
                    color: state.appLanguage == Language.en
                        ? ColorsManager.darkGrey
                        : ColorsManager.grey,
                    fontWeight: state.appLanguage == Language.en
                        ? FontWeightHelper.bold
                        : FontWeightHelper.regular,
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
