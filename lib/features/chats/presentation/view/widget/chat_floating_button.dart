import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/widget/app_floating_button.dart';
import 'users_view/show_all_user.dart';

class ChatFloatingButton extends StatelessWidget {
  const ChatFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: AppFloatingButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => const ShowAllUser(),
            ),
          );
        },
        icon: Icons.message,
      ),
    );
  }
}
