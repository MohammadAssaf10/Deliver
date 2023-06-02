import 'package:flutter/material.dart';

import '../../config/color_manager.dart';
import '../../config/styles_manager.dart';
import '../../generated/l10n.dart';
import '../di/di.dart';
import '../language/cubit/language_cubit.dart';
import '../language/language.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LanguageCubit languageCubit = getIt<LanguageCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () {
              languageCubit.setArabic();
            },
            child: Text(
              S.of(context).arabic,
              textAlign: TextAlign.end,
              style: getRegularStyle(
                fontSize: 14,
                color: isLanguageEnglish()
                    ? ColorManager.grey
                    : ColorManager.primary,
              ),
            ),
          ),
        ),
        Text(
          "/",
          style: getRegularStyle(
            fontSize: 14,
            color: ColorManager.grey,
          ),
        ),
        Flexible(
          child: GestureDetector(
            onTap: () {
              languageCubit.setEnglish();
            },
            child: Text(
              S.of(context).english,
              style: getRegularStyle(
                fontSize: 14,
                color: isLanguageEnglish()
                    ? ColorManager.primary
                    : ColorManager.grey,
              ),
            ),
          ),
        )
      ],
    );
  }
}
