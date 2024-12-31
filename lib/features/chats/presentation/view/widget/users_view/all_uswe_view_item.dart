import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter/material.dart';
import 'package:mini_whatsapp/features/chats/presentation/view/widget/util.dart';

class AllUserViewItem extends StatelessWidget {
  final types.User user;
  const AllUserViewItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final color = getUserAvatarNameColor(user);
    final hasImage = user.imageUrl != null;

    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundColor: hasImage ? Colors.transparent : color,
            backgroundImage: hasImage ? NetworkImage(user.imageUrl!) : null,
            radius: 20,
            child: null,
          ),
        ),
        Text(user.firstName ?? 'Anonymous'),
      ],
    );
  }
}
