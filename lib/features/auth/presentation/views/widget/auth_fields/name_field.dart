part of '../signup_form.dart';

class NameField extends StatelessWidget {
  final TextEditingController nameController;
  const NameField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return AppTextForm(
      hintText: 'Name',
      controller: nameController,
      prefixIcon: const Icon(Icons.person),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter yor name';
        }
      },
    );
  }
}
