part of '../login_form.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  const PasswordField({super.key, required this.passwordController});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return AppTextForm(
      controller: widget.passwordController,
      hintText: "Password",
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            !AppRegex.isPasswordValid(value)) {
          return 'Password should be at least 8 characters \nand least one uppercase, one lowercase letter \nand one number';
        }
      },
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: const Icon(Icons.lock),
      obscureText: isObscureText,
      suffixIcon: IconButton(
        icon: Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
        onPressed: () {
          setState(() {
            isObscureText = !isObscureText;
          });
        },
      ),
    );
  }
}
