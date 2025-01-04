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
                  ? TextStyles.font15ErrorRegular
                  : (labelStyle ?? TextStyles.font15BlackRegular),
              labelText: formFieldState.hasError
                  ? validator(controller.text) ?? labelTitle
                  : labelTitle,
              fillColor: ColorsManager.customWhite,
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
            style: labelStyle ?? TextStyles.font15BlackRegular,
          );
        },
      ),
    );
  }
}
