import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/theming/app_text_styles.dart';

class RoomListViewItem extends StatelessWidget {
  final String? name, image, lastMessage, lastTime;
  final bool isCurrentUserSender;

  const RoomListViewItem({
    super.key,
    required this.name,
    required this.image,
    this.lastMessage,
    this.lastTime,
    required this.isCurrentUserSender,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = image != null;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: hasImage ? Colors.transparent : Colors.red,
        backgroundImage: hasImage ? NetworkImage(image!) : null,
        radius: 20,
        child: null,
      ),
      title: Text(
        name ?? 'Anonymous',
        style: AppTextStyles.font18Semibold,
      ),
      subtitle: Row(
        children: [
          isCurrentUserSender
              ? const Icon(Icons.done_all, color: Colors.blueGrey, size: 20)
              : const SizedBox.shrink(),
          const SizedBox(width: 5),
          Text(
            lastMessage ?? '',
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          lastTime ?? '',
          style: AppTextStyles.font12Grey,
        ),
      ),
    );
  }
}
