import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/const/spaser.dart';
import 'package:mini_whatsapp/core/widget/app_text_button.dart';
import 'package:mini_whatsapp/features/profile/presentation/view/widget/edit_profile_form.dart';
import 'package:mini_whatsapp/features/profile/presentation/view/widget/profile_image.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileImage(),
          verticalSpace(20),
          const Divider(),
          verticalSpace(20),
          const EditProfileForm(),
          verticalSpace(40),
          AppTextButton(buttonText: 'Save', onPressed: () {})
        ],
      ),
    );
  }
}
