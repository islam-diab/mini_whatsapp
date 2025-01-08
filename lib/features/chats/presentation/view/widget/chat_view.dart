import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:mini_whatsapp/core/helper/notification.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
    required this.room,
  });

  final types.Room room;

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final updatedMessage = message.copyWith(previewData: previewData);

    FirebaseChatCore.instance.updateMessage(updatedMessage, room.id);
  }

  void _handleSendPressed(types.PartialText message) async {
    FirebaseChatCore.instance.sendMessage(
      message,
      room.id,
    );
    final otherUser = room.users.firstWhere(
        (user) => user.id != FirebaseChatCore.instance.firebaseUser?.uid);
    await NotificationService.sendNotification(
        otherUser.id, room.name ?? '', message.text);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(room.name ?? 'Islam salama'),
        ),
        body: StreamBuilder<types.Room>(
          initialData: room,
          stream: FirebaseChatCore.instance.room(room.id),
          builder: (context, snapshot) => StreamBuilder<List<types.Message>>(
            initialData: const [],
            stream: FirebaseChatCore.instance.messages(snapshot.data!),
            builder: (context, snapshot) {
              return Chat(
                showUserAvatars: true,
                emojiEnlargementBehavior: EmojiEnlargementBehavior.single,
                theme: const DefaultChatTheme(),
                messages: snapshot.data ?? [],
                onPreviewDataFetched: _handlePreviewDataFetched,
                onSendPressed: _handleSendPressed,
                user: types.User(
                  id: FirebaseChatCore.instance.firebaseUser?.uid ?? '',
                ),
              );
            },
          ),
        ),
      );
}
