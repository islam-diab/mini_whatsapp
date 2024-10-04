import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/constants/assets_constants.dart';
import 'package:mini_whatsapp/core/routing/routes.dart';
import 'package:mini_whatsapp/core/theming/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(flex: 3, child: SizedBox.shrink()),
          Image.asset(
            AppAssets.splash,
            width: 200,
          ),
          const Expanded(flex: 2, child: SizedBox.shrink()),
          const Text(
            'The Best Chat App of this company',
            style: AppTextStyles.font18Semibold,
          ),
          const Expanded(flex: 1, child: SizedBox.shrink()),
        ],
      ),
    ));
  }
}
