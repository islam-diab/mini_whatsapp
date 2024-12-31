import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

class DeleteChatDialog extends StatelessWidget {
  final String roomName, roomId;
  const DeleteChatDialog(
      {super.key, required this.roomName, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Delete Chat')),
      content: Text.rich(
        TextSpan(
          text: 'Do you want to delete ',
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: roomName,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const TextSpan(text: '?'),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          onPressed: () {
            Navigator.pop(context);
            FirebaseChatCore.instance.deleteRoom(roomId);
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
