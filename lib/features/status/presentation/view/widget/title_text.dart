import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/theming/app_text_styles.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        title,
        style: AppTextStyles.font18Semibold,
      ),
    );
  }
}
