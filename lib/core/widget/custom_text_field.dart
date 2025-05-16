import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theming/colors_manager.dart';
import '../theming/font_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
     this.labelTitle,
     this.hintText,
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
    this.fillColor = ColorsManager.customWhite,
  });

  final TextEditingController controller;
  final String? labelTitle;
  final String? hintText;
  final String? Function(String? value) validator;
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
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: FormField<String>(
        validator: (_) {
          return validator(controller.text);
        },
        autovalidateMode: AutovalidateMode.disabled,
        builder: (formFieldState) {
          return TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            autovalidateMode: AutovalidateMode.disabled,
            cursorColor: cursorColor ?? ColorsManager.darkGrey,
            onTapOutside: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            decoration: InputDecoration(
              labelStyle: formFieldState.hasError
                  ? const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeightHelper.regular,
                      color: ColorsManager.error,
                    )
                  : (labelStyle ??
                      const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeightHelper.regular,
                        color: ColorsManager.darkGrey,
                      )),
              labelText: formFieldState.hasError
                  ? validator(controller.text) ?? labelTitle
                  : labelTitle,
              hintText: hintText,
              hintStyle:formFieldState.hasError
                  ? const TextStyle(
                fontSize: 15,
                fontWeight: FontWeightHelper.regular,
                color: ColorsManager.error,
              )
                  : (labelStyle ??
                  const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeightHelper.regular,
                    color: ColorsManager.darkGrey,
                  )),
              fillColor: fillColor,
              filled: true,
              prefixIcon: prefixIcon != null
                  ? Icon(
                      prefixIcon,
                      color: Colors.black,
                    )
                  : null,
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      onPressed: () {
                        if (suffixIconAction != null) {
                          suffixIconAction!();
                        }
                      },
                      icon: Icon(
                        suffixIcon,
                        color: obscureText
                            ? ColorsManager.grey
                            : ColorsManager.darkGrey,
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
                borderSide: BorderSide(
                  color: formFieldState.hasError
                      ? ColorsManager.error
                      : ColorsManager.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: formFieldState.hasError
                        ? ColorsManager.error
                        : ColorsManager.darkGrey),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: formFieldState.hasError
                      ? ColorsManager.error
                      : ColorsManager.grey,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: formFieldState.hasError
                      ? ColorsManager.error
                      : ColorsManager.grey,
                ),
              ),
            ),
            inputFormatters: [
              if (textInputFormatter != null) textInputFormatter!
            ],
            onFieldSubmitted: onFieldSubmitted,
            textInputAction: textInputAction ?? TextInputAction.go,
            style: labelStyle ??
                const TextStyle(
                  fontSize: 15,
                  color: ColorsManager.darkGrey,
                  fontWeight: FontWeightHelper.regular,
                ),
          );
        },
      ),
    );
  }
}
