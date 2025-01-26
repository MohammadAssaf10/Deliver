import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../di/di.dart';
import '../theming/colors_manager.dart';
import '../widget/loader.dart';
import 'app_enums.dart';
import 'app_extensions.dart';

void dPrint(String? message, {StringColor? stringColor}) {
  if (kDebugMode && message != null) {
    debugPrint(message.withColor(stringColor));
  }
}

_isCurrentDialogShowing(BuildContext context) =>
    ModalRoute.of(context)?.isCurrent != true;

dismissDialog(BuildContext context) {
  if (_isCurrentDialogShowing(context)) {
    Navigator.of(context, rootNavigator: true).pop(true);
  }
}

void showToastMessage(
  String toastMessage, {
  bool isError = false,
}) {
  Fluttertoast.showToast(
    gravity: ToastGravity.BOTTOM,
    msg: toastMessage,
    backgroundColor: isError ? ColorsManager.error : ColorsManager.darkWhite,
    fontSize: 16,
    textColor: isError ? ColorsManager.darkWhite : ColorsManager.darkGrey,
  );
}

void showLoadingDialog(BuildContext context, {Color? backgroundColor}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: backgroundColor,
    builder: (_) => Dialog(
      key: getIt<GlobalKey<State>>(),
      backgroundColor: backgroundColor ?? Colors.transparent,
      child: const Loader(
        size: 50,
      ),
    ),
  );
}

void closeLoadingDialogIfVisible() {
  if (getIt<GlobalKey<State>>().currentContext != null) {
    Navigator.of(getIt<GlobalKey<State>>().currentContext!, rootNavigator: true).pop();
  }
}
