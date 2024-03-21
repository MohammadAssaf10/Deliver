import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/presentation/bloc/app_cubit.dart';
import '../../generated/l10n.dart';
import '../theming/styles_manager.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () {
              context.read<AppCubit>().setAppLanguage('ar');
            },
            child: Text(
              S.of(context).arabic,
              textAlign: TextAlign.end,
              style: context.read<AppCubit>().state.isEnglishLanguage
                  ? TextStyles.font14GreyRegular
                  : TextStyles.font14PrimaryRegular,
            ),
          ),
        ),
        Text(
          " / ",
          style: TextStyles.font14GreyRegular,
        ),
        Flexible(
          child: GestureDetector(
            onTap: () {
              context.read<AppCubit>().setAppLanguage('en');
            },
            child: Text(
              S.of(context).english,
              style: context.read<AppCubit>().state.isEnglishLanguage
                  ? TextStyles.font14PrimaryRegular
                  : TextStyles.font14GreyRegular,
            ),
          ),
        )
      ],
    );
  }
}
