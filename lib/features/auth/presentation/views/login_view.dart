import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_whatsapp/core/routing/routes.dart';
import 'package:mini_whatsapp/core/widget/app_text_button.dart';
import 'package:mini_whatsapp/features/auth/presentation/view_models/login_cubit.dart';
import 'package:mini_whatsapp/features/auth/presentation/views/widget/auth_bloc_listener.dart';
import 'package:mini_whatsapp/features/auth/presentation/views/widget/login_form.dart';
import 'package:mini_whatsapp/features/auth/presentation/views/widget/logo_and_title.dart';
import 'package:mini_whatsapp/features/auth/presentation/views/widget/auth_text_span.dart';

part 'widget/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: LoginBody(),
          ),
        ),
      ),
    );
  }
}
