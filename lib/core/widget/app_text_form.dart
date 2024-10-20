import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/theming/app_colors.dart';

class AppTextForm extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Function(String?) validator;
  const AppTextForm(
      {super.key,
      required this.hintText,
      required this.controller,
      this.keyboardType,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText,
      required this.validator, this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
        border: customOutLine(AppColors.teaGreen),
        focusedBorder: customOutLine(AppColors.primaryColor),
        errorBorder: customOutLine(Colors.red),
      ),
    );
  }

  OutlineInputBorder customOutLine(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 2.0,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );
  }
}
