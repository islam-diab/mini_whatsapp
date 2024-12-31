import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:mini_whatsapp/features/chats/presentation/view/widget/chat_view.dart';
import 'package:mini_whatsapp/features/chats/presentation/view/widget/delete_chat_dialog.dart';
import 'package:mini_whatsapp/features/chats/presentation/view/widget/room_list_view_item.dart';

class RoomListView extends StatelessWidget {
  final List<Room> rooms;
  final List<String> lastMessages;
  final List<String> lastTimes;
  final List<bool> isCurrentUserSender;

  const RoomListView({
    super.key,
    required this.rooms,
    required this.lastMessages,
    required this.lastTimes,
    required this.isCurrentUserSender,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rooms.length,
      itemBuilder: (context, index) {
        final room = rooms[index];
        final lastMessage = lastMessages[index];
        final lastTime = lastTimes[index];
        final isSender = isCurrentUserSender[index];

        return GestureDetector(
          onLongPress: () {
            showAdaptiveDialog(
                context: context,
                builder: (context) {
                  return DeleteChatDialog(
                    roomId: room.id,
                    roomName: room.name!,
                  );
                });
          },
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChatView(
                  room: room,
                ),
              ),
            );
          },
          child: RoomListViewItem(
            image: room.imageUrl,
            name: room.name,
            lastMessage: lastMessage,
            lastTime: lastTime,
            isCurrentUserSender: isSender,
          ),
        );
      },
    );
  }
}
