part of '../chats_view.dart';
class ChatFloatingButton extends StatelessWidget {
  const ChatFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
        bottom: 20,
        right: 20,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
      );
  }
}