import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_whatsapp/core/routing/routes.dart';
import 'package:mini_whatsapp/features/auth/data/data_sources/data_source.dart';
import 'package:mini_whatsapp/features/auth/data/repositories/login_repository.dart';
import 'package:mini_whatsapp/features/auth/presentation/view_models/login_cubit.dart';
import 'package:mini_whatsapp/features/auth/presentation/views/login_view.dart';
import 'package:mini_whatsapp/features/splash/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // final argument = settings.arguments;

    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(
              LoginRepository(dataSource: DataSource()),
            ),
            child: const LoginView(),
          ),
        );

      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      default:
        return null;
    }
  }
}
