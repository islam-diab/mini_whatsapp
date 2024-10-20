import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/const/spaser.dart';
import 'package:mini_whatsapp/core/helper/app_regex.dart';
import 'package:mini_whatsapp/core/widget/app_text_form.dart';

part 'auth_fields/email_field.dart';
part 'auth_fields/password_field.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            EmailField(emailController: emailController),
            verticalSpace(20),
            PasswordField(passwordController: passwordController),
          ],
        ),
      ),
    );
  }
}
