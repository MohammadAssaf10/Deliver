import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_manager.dart';
import '../../../../core/utils/app_language.dart';
import '../../../../core/utils/app_validator.dart';
import '../bloc/verification_code_bloc.dart';

class VerificationCodeFields extends StatelessWidget {
  const VerificationCodeFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<VerificationCodeBloc>().formKey,
      child: Directionality(
        textDirection: AppLanguage.isEnglishLocale(context)
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Pinput(
          controller:
          context.read<VerificationCodeBloc>().verificationCodeController,
          animationCurve: Curves.easeInOut,
          toolbarEnabled: false,
          pinAnimationType: PinAnimationType.slide,
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          textInputAction: TextInputAction.done,
          animationDuration: const Duration(
            milliseconds: 200,
          ),
          errorTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeightHelper.regular,
            color: ColorsManager.error,
          ),
          cursor: Text(
            '|',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeightHelper.bold,
              color: ColorsManager.darkGrey,
            ),
          ),
          length: 6,
          keyboardType: TextInputType.number,
          onTapOutside: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onSubmitted: (_) {
            if (context
                .read<VerificationCodeBloc>()
                .formKey
                .currentState!
                .validate()) {
              context.read<VerificationCodeBloc>().verifyPhoneNumber();
            }
          },
          onCompleted: (_) {
            if (context
                .read<VerificationCodeBloc>()
                .formKey
                .currentState!
                .validate()) {
              context.read<VerificationCodeBloc>().verifyPhoneNumber();
            }
          },
          closeKeyboardWhenCompleted: false,
          validator: AppValidator.verificationCodeValidator,
          defaultPinTheme: PinTheme(
            height: 50,
            width: 50,
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeightHelper.bold,
              color: ColorsManager.darkGrey,
            ),
            decoration: BoxDecoration(
              color: ColorsManager.customWhite,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: ColorsManager.darkGrey,
                width: 3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
