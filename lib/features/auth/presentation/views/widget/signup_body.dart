part of '../signup_view.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = context.read<AuthCubit>().formKey;

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
              context.read<AuthCubit>().register();
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
        const AuthBlocListener(),
      ],
    );
  }
}
