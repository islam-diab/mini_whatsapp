import 'package:flutter/material.dart';

import 'package:mini_whatsapp/features/profile/presentation/view/widget/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
      ),
      body: const ProfileBody(),
    );
  }
}
