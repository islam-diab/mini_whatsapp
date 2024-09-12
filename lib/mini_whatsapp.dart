import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/routing/routes.dart';

import 'core/routing/app_router.dart';

class MiniWhatsapp extends StatelessWidget {
  final AppRouter appRouter;

  const MiniWhatsapp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.login,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
