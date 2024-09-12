import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_whatsapp/core/routing/routes.dart';
import 'package:mini_whatsapp/features/login/data/data_source.dart';
import 'package:mini_whatsapp/features/login/data/login_repository.dart';
import 'package:mini_whatsapp/features/login/logic/login_cubit.dart';
import 'package:mini_whatsapp/features/login/ui/login_view.dart';

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

      default:
        return null;
    }
  }
}
