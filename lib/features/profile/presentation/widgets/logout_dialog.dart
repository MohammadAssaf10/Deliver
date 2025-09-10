import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/presentation/cubit/app_cubit.dart';
import '../../../../app/presentation/cubit/app_state.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
import '../../../../generated/l10n.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listener: (context, state) {
        if (state.logoutStatus.isLoading) {
          showLoadingDialog(context);
        } else if (state.logoutStatus.isError) {
          closeLoadingDialogIfVisible();
        } else if (state.logoutStatus.isSuccess) {
          closeLoadingDialogIfVisible();
          context.pushNamedAndRemoveUntil(
            Routes.signInPage,
            predicate: (_) => false,
          );
        }
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Dialog(
          elevation: 0,
          backgroundColor: ColorsManager.customWhite,
          insetPadding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
          child: Container(
            height: 170,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Center(
                    child: CustomAutoSizeText(
                      text: 'Are you sure you want to logout?',
                      minFontSize: 16,
                      initialFontSize: 18,
                      maxFontSize: 20,
                      fontWeight: FontWeightHelper.bold,
                      color: ColorsManager.darkGrey,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppTextButton(
                        onPressed: () {
                          context.pop();
                        },
                        backgroundColor: ColorsManager.customWhite,
                        borderSide: const BorderSide(
                          color: ColorsManager.darkGrey,
                          width: 2,
                        ),
                        buttonHeight: 45,
                        child: CustomAutoSizeText(
                          text: S.of(context).cancel,
                          minFontSize: 14,
                          initialFontSize: 16,
                          maxFontSize: 18,
                          color: ColorsManager.darkGrey,
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),
                    Expanded(
                      child: AppTextButton(
                        onPressed: () {
                          context.read<AppCubit>().logout();
                        },
                        buttonHeight: 45,
                        child: CustomAutoSizeText(
                          text: S.of(context).logout,
                          minFontSize: 14,
                          initialFontSize: 16,
                          maxFontSize: 18,
                          color: ColorsManager.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
