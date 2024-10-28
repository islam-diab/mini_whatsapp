import 'package:flutter/widgets.dart';
import 'package:mini_whatsapp/core/const/spaser.dart';
import 'package:mini_whatsapp/core/theming/app_text_styles.dart';
import 'package:mini_whatsapp/core/widget/app_text_form.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Name',
            style: AppTextStyles.font18Semibold,
          ),
          verticalSpace(10),
          AppTextForm(
            hintText: 'Islam Diab',
            controller: TextEditingController(),
          ),
          const SizedBox(height: 20),
          const Text(
            'Phone',
            style: AppTextStyles.font18Semibold,
          ),
          verticalSpace(10),
          AppTextForm(
            hintText: '0123456789',
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
