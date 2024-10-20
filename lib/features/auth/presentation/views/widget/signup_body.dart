part of '../signup_view.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Column(
      children: [
        const LogoAndTitle(
          text: 'Register To New Account',
        ),
        SignupForm(
          formKey: formKey,
        ),
        AppTextButton(
          buttonText: 'Sing Up',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.pushReplacementNamed(context, Routes.home);
            }
          },
        ),
        AuthTextSpan(
          text: 'Already have an account ? ',
          pageName: 'Login here',
          onTap: () {
            Navigator.pushNamed(context, Routes.login);
          },
        ),
        verticalSpace(20),
      ],
    );
  }
}
