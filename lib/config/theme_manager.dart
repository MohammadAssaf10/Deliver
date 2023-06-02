import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'styles_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorManager.backgroundColor,
    // app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primary,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.nullColor,
        systemNavigationBarColor: ColorManager.nullColor,
        systemNavigationBarDividerColor: ColorManager.nullColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: getRegularStyle(fontSize: 18, color: ColorManager.white),
    ),

    textTheme: TextTheme(
      titleMedium: getRegularStyle(
        fontSize: 18,
        color: ColorManager.primary,
      ),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorManager.primary,
      selectionHandleColor: ColorManager.primary,
      selectionColor: ColorManager.primary,
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // hint style
      hintStyle: getRegularStyle(color: ColorManager.secondPrimary, fontSize: 16),
      labelStyle: getRegularStyle(color: ColorManager.grey, fontSize: 16),
      errorStyle: getRegularStyle(color: ColorManager.error, fontSize: 14),
      prefixIconColor: ColorManager.grey,
      suffixIconColor: ColorManager.grey,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      // enabled border style
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      // focused border style
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      // error border style
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      // focused error border style
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    // icon theme
    iconTheme: const IconThemeData(color: ColorManager.white, size: 24),
    // text button
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorManager.grey;
            } else {
              return ColorManager.primary;
            }
          },
        ),
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return getRegularStyle(color: ColorManager.grey, fontSize: 18);
          } else {
            return getRegularStyle(color: ColorManager.primary, fontSize: 18);
          }
        }),
      ),
    ),
    // elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorManager.grey;
          } else {
            return ColorManager.primary;
          }
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorManager.white;
          } else {
            return ColorManager.white;
          }
        }),
        shadowColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorManager.white;
          } else {
            return ColorManager.primary;
          }
        }),
        side: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide.none;
          } else {
            return const BorderSide(color: ColorManager.primary);
          }
        }),
        elevation: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return 0;
          } else {
            return 6;
          }
        }),
        // side: MaterialStateProperty.resolveWith(
        //     (states) => const BorderSide(color: ColorManager.white)),

        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.all(getRegularStyle(
          fontSize: 16,
          color: ColorManager.primary,
        )),
        side: MaterialStateProperty.all(
            const BorderSide(color: ColorManager.primary)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  );
}
