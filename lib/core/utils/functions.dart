import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../generated/l10n.dart';
import '../theming/colors_manager.dart';
import '../theming/styles_manager.dart';
import 'constant.dart';
import 'extensions.dart';

String? usernameValidator(String? name) {
  if (name.nullOrEmpty()) {
    return S.current.pleaseEnterUserName;
  } else if (name!.length < 4) {
    return S.current.usernameShort;
  }
  return null;
}

String? mobileNumberValidator(String? phone) {
  if (phone.nullOrEmpty()) {
    return S.current.pleaseEnterMobileNumber;
  } else if (!AppRegex.isMobileNumberValid(phone!) ||
      phone.length < 10 ||
      phone.length > 10 ||
      !phone.startsWith("09")) {
    return S.current.mobileNumberFormatNotCorrect;
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password.nullOrEmpty()) {
    return S.current.pleaseEnterPassword;
  } else if (password!.length < 8) {
    return S.current.passwordShouldAtLeast8Character;
  }
  return null;
}

String? cantBeEmpty(String? v) {
  if (v.nullOrEmpty()) {
    return S.current.pleaseCompleteField;
  }
  return null;
}

_isCurrentDialogShowing(BuildContext context) =>
    ModalRoute.of(context)?.isCurrent != true;

dismissDialog(BuildContext context) {
  if (_isCurrentDialogShowing(context)) {
    Navigator.of(context, rootNavigator: true).pop(true);
  }
}

void showCustomToast({
  required String toastMessage,
  required BuildContext context,
  bool isError = false,
}) {
  FToast().init(context);
  FToast().showToast(
    gravity: ToastGravity.BOTTOM,
    child: Container(
      decoration: ShapeDecoration(
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        color: isError ? ColorsManager.error : ColorsManager.primary,
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        toastMessage,
        textAlign: TextAlign.center,
        style: TextStyles.font16WhiteRegular,
      ),
    ),
  );
}
