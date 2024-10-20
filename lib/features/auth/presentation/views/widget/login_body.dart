part of '../login_view.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Column(
      children: [
        const LogoAndTitle(
          text: 'Login To Your Account',
        ),
        LoginForm(
          formKey: formKey,
        ),
        AppTextButton(
          buttonText: 'Login',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.pushReplacementNamed(context, Routes.home);
            }
          },
        ),
         AuthTextSpan(
          text: 'Don\'t have an account ? ',
          pageName: 'Register here',
          onTap: () {
            Navigator.pushNamed(context, Routes.register);
          },
          
         ),
      ],
    );
  }
}
