import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/widget/app_floating_button.dart';
import 'widget/users_view/show_all_user.dart';

import 'widget/room_bloc_builder.dart';

class RoomView extends StatelessWidget {
  const RoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AppFloatingButton(
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
      body: const Stack(
        children: [
          RoomBlocBuilder(),
        ],
      ),
    );
  }
}
