part of '../signup_form.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController phoneController;
  const PhoneField({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return AppTextForm(
      hintText: 'Phone',
      controller: phoneController,
      prefixIcon: const Icon(Icons.phone),
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            !AppRegex.isPhoneNumberValid(value)) {
          return 'Please enter a valid email';
        }
      },
    );
  }
}
