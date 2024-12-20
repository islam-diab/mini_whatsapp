import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_whatsapp/core/const/spaser.dart';
import 'package:mini_whatsapp/core/helper/app_regex.dart';
import 'package:mini_whatsapp/core/widget/app_text_form.dart';
import 'package:mini_whatsapp/features/auth/presentation/view_models/login_cubit.dart';

part 'auth_fields/email_field.dart';
part 'auth_fields/password_field.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            EmailField(
                emailController: context.read<AuthCubit>().emailController),
            verticalSpace(20),
            PasswordField(
                passwordController:
                    context.read<AuthCubit>().passwordController),
          ],
        ),
      ),
    );
  }
}
