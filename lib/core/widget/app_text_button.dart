import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/theming/app_colors.dart';
import 'package:mini_whatsapp/core/theming/app_text_styles.dart';

class AppTextButton extends StatelessWidget {
  final Color? backgroundColor;
  final String buttonText;
  final VoidCallback onPressed;
  const AppTextButton({
    super.key,
    this.backgroundColor,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? AppColors.primaryColor,
          ),
          fixedSize: WidgetStateProperty.all(
            const Size(double.maxFinite, 60),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: AppTextStyles.font24BoldWhite,
        ),
      ),
    );
  }
}
