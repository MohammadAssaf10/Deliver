import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theming/colors_manager.dart';
import '../theming/styles_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelTitle,
    required this.controller,
    required this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconAction,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.textInputFormatter,
    this.textInputAction,
    this.cursorColor,
    this.labelStyle,
    this.contentPadding,
  });

  final TextEditingController controller;
  final String labelTitle;
  final Function(String? value) validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixIconAction;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextInputFormatter? textInputFormatter;
  final TextInputAction? textInputAction;
  final void Function(String value)? onFieldSubmitted;
  final Color? cursorColor;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        cursorColor: cursorColor ?? ColorsManager.black,
        onTapOutside: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          labelStyle: labelStyle ?? TextStyles.font15BlackRegular,
          hintStyle: labelStyle ?? TextStyles.font15BlackRegular,
          labelText: labelTitle,
          fillColor: ColorsManager.textFieldBackgroundColor,
          filled: true,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: () {
                    if (suffixIconAction != null) {
                      suffixIconAction!();
                    }
                  },
                  icon: Icon(
                    suffixIcon,
                    color:
                        obscureText ? ColorsManager.grey : ColorsManager.black,
                  ),
                )
              : null,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorsManager.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.black),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.error),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.error),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        inputFormatters: [if (textInputFormatter != null) textInputFormatter!],
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction ?? TextInputAction.go,
        style: labelStyle ?? TextStyles.font15BlackRegular,
        validator: (String? v) {
          return validator(v);
        },
      ),
    );
  }
}
