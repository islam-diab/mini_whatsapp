import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_whatsapp/core/routing/routes.dart';
import 'package:mini_whatsapp/core/theming/app_text_styles.dart';
import 'package:mini_whatsapp/features/auth/presentation/view_models/login_cubit.dart';

class AuthBlocListener extends StatelessWidget {
  const AuthBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) {
        return current is AuthLoading ||
            current is AuthSuccess ||
            current is AuthError;
      },
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is AuthSuccess) {
          Navigator.pushNamed(context, Routes.home);
        } else if (state is AuthError) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              icon: const Icon(
                Icons.error,
                color: Colors.red,
                size: 32,
              ),
              content: Text(
                state.error,
                style: AppTextStyles.font20bold,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Got it',
                  ),
                ),
              ],
            ),
          );
        }
      },
      child: Container(),
    );
  }
}
