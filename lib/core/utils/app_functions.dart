import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

void showCustomToast({
  required String toastMessage,
  bool isError = false,
}) {
  Fluttertoast.showToast(
    gravity: ToastGravity.BOTTOM,
    msg: toastMessage,
    backgroundColor: isError ? ColorsManager.error : ColorsManager.darkGrey,
    fontSize: 16,
    textColor: ColorsManager.white,
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
    getIt<GlobalKey<State>>().currentContext!.pop();
  }
}

Future<String> fetchGoogleMapKey() async {
  final MethodChannel channel = MethodChannel('deliverChannel');
  return await channel.invokeMethod('getGoogleMapKey');
}
