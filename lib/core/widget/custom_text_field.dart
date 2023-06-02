import 'package:flutter/material.dart';

import '../../config/color_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.labelTitle,
    required this.controller,
    required this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconAction,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);
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
        decoration: InputDecoration(
          labelText: labelTitle,
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
                    color: obscureText ? ColorManager.grey : ColorManager.primary,
                  ),
                )
              : null,
        ),
        validator: (String? v) {
          return validator(v);
        },
      ),
    );
  }
}
