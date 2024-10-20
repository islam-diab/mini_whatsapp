import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/constants/app_assets.dart';
import 'package:mini_whatsapp/core/theming/app_text_styles.dart';

class LogoAndTitle extends StatelessWidget {
  final String text;
  const LogoAndTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Column(
        children: [
          Image.asset(
            AppAssets.splash,
            width: 200,
            height: 200,
          ),
          Text(
            text,
            style: AppTextStyles.font24Bold,
          ),
        ],
      ),
    );
  }
}
