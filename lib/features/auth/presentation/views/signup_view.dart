import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/const/spaser.dart';
import 'package:mini_whatsapp/core/routing/routes.dart';
import 'package:mini_whatsapp/core/widget/app_text_button.dart';
import 'package:mini_whatsapp/features/auth/presentation/views/widget/logo_and_title.dart';
import 'package:mini_whatsapp/features/auth/presentation/views/widget/signup_form.dart';
import 'package:mini_whatsapp/features/auth/presentation/views/widget/auth_text_span.dart';

part 'widget/signup_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: SignupBody(),
        ),
      ),
    );
  }
}
