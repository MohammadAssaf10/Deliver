import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../config/color_manager.dart';
import '../../config/styles_manager.dart';
import '../../generated/l10n.dart';
import 'extensions.dart';

String? usernameValidator(String? name) {
  if (name.nullOrEmpty()) {
    return S.current.pleaseEnterUserName;
  } else if (name!.length < 4) {
    return S.current.usernameShort;
  }
  return null;
}

bool isMobileNumberCorrect(String mobileNumber) {
  return RegExp(r"^[+]*[0-9]+").hasMatch(mobileNumber);
}

String? mobileNumberValidator(String? phone) {
  if (phone.nullOrEmpty()) {
    return S.current.pleaseEnterMobileNumber;
  } else if (!isMobileNumberCorrect(phone!) ||
      phone.length < 10 ||
      phone.length > 10 ||
      !phone.startsWith("09")) {
    return S.current.mobileNumberFormatNotCorrect;
  }
  return null;
}

bool isEmailFormatCorrect(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

String? emailValidator(String? email) {
  if (email.nullOrEmpty()) {
    return S.current.pleaseEnterEmail;
  } else if (!isEmailFormatCorrect(email!)) {
    return S.current.emailFormatNotCorrect;
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
        color: isError ? ColorManager.error : ColorManager.primary,
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        toastMessage,
        textAlign: TextAlign.center,
        style: getRegularStyle(
          fontSize: 16,
          color: ColorManager.white,
        ),
      ),
    ),
  );
}
