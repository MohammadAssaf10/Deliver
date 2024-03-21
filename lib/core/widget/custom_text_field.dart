import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';

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
  });

  final TextEditingController controller;
  final String labelTitle;
  final Function(String? value) validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixIconAction;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onTapOutside: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
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
                    color: obscureText
                        ? ColorsManager.grey
                        : ColorsManager.primary,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorsManager.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.primary),
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
        validator: (String? v) {
          return validator(v);
        },
      ),
    );
  }
}
