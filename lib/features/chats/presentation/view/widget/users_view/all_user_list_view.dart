import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:mini_whatsapp/features/chats/presentation/view/widget/chat_view.dart';
import 'package:mini_whatsapp/features/chats/presentation/view/widget/users_view/all_uswe_view_item.dart';

class AllUserListView extends StatelessWidget {
  final AsyncSnapshot<List<User>> snapshot;
  const AllUserListView({super.key, required this.snapshot});

  void _handlePressed(types.User otherUser, BuildContext context) async {
    final navigator = Navigator.of(context);
    final room = await FirebaseChatCore.instance.createRoom(otherUser);

    navigator.pop();
    await navigator.push(
      MaterialPageRoute(
        builder: (context) => ChatView(
          room: room,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        final user = snapshot.data![index];

        return GestureDetector(
          onTap: () {
            _handlePressed(user, context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              children: [
                AllUserViewItem(user: user),
              ],
            ),
          ),
        );
      },
    );
  }
}
