import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_whatsapp/core/routing/routes.dart';
import 'package:mini_whatsapp/features/auth/data/data_sources/data_source.dart';
import 'package:mini_whatsapp/features/auth/data/repositories/auth_repository.dart';
import 'package:mini_whatsapp/features/auth/presentation/view_models/login_cubit.dart';
import 'package:mini_whatsapp/features/auth/presentation/views/login_view.dart';
import 'package:mini_whatsapp/features/auth/presentation/views/signup_view.dart';
import 'package:mini_whatsapp/features/chats/data/chats_data_source.dart';
import 'package:mini_whatsapp/features/chats/data/chats_repository.dart';
import 'package:mini_whatsapp/features/chats/presentation/view_model/chats_cubit.dart';
import 'package:mini_whatsapp/features/group/presentation/view/group_view.dart';
import 'package:mini_whatsapp/features/group/presentation/view_model/group_cubit.dart';
import 'package:mini_whatsapp/features/home/presentation/view/home_view.dart';
import 'package:mini_whatsapp/features/splash/presentation/view/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // final argument = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(
              AuthRepository(dataSource: DataSource()),
            ),
            child: const LoginView(),
          ),
        );

      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(
              AuthRepository(dataSource: DataSource()),
            ),
            child: const SignupView(),
          ),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ChatsCubit(ChatsRepository(homeDataSource: ChatsDataSource()))
                  ..fetchRooms(),
            child: const HomeView(),
          ),
        );

      case Routes.group:
        return MaterialPageRoute(
            builder: (constext) => BlocProvider(
                  create: (context) => GroupCubit(),
                  child: GroupView(),
                ));

      default:
        return null;
    }
  }
}
