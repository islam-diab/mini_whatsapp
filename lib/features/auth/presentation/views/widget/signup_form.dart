import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_whatsapp/core/const/spaser.dart';
import 'package:mini_whatsapp/core/helper/app_regex.dart';
import 'package:mini_whatsapp/core/widget/app_text_form.dart';
import 'package:mini_whatsapp/features/auth/presentation/view_models/login_cubit.dart';
import 'package:mini_whatsapp/features/auth/presentation/views/widget/login_form.dart';

part 'auth_fields/phone_field.dart';
part 'auth_fields/name_field.dart';

class SignupForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SignupForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            NameField(nameController: context.read<AuthCubit>().nameController),
            verticalSpace(20),
            EmailField(
                emailController: context.read<AuthCubit>().emailController),
            verticalSpace(20),
            PhoneField(
                phoneController: context.read<AuthCubit>().phoneController),
            verticalSpace(20),
            PasswordField(
                passwordController:
                    context.read<AuthCubit>().passwordController),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
