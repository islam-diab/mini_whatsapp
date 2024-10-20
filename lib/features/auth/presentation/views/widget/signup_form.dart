import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/const/spaser.dart';
import 'package:mini_whatsapp/core/helper/app_regex.dart';
import 'package:mini_whatsapp/core/widget/app_text_form.dart';
import 'package:mini_whatsapp/features/auth/presentation/views/widget/login_form.dart';

part 'auth_fields/phone_field.dart';
part 'auth_fields/name_field.dart';

class SignupForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SignupForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            NameField(nameController: nameController),
            verticalSpace(20),
            EmailField(emailController: emailController),
            verticalSpace(20),
            PhoneField(phoneController: phoneController),
            verticalSpace(20),
            PasswordField(passwordController: passwordController),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
