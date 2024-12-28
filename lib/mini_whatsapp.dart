import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_whatsapp/core/routing/routes.dart';
import 'package:mini_whatsapp/core/theming/app_colors.dart';

import 'core/routing/app_router.dart';

class MiniWhatsapp extends StatelessWidget {
  final AppRouter appRouter;

  const MiniWhatsapp({super.key, required this.appRouter});

  //if user login
  String checkIfUserLogin() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return Routes.splash;
    } else {
      return Routes.login;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        textTheme: GoogleFonts.interTextTheme(),
        useMaterial3: true,
      ),
      initialRoute: checkIfUserLogin(),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
