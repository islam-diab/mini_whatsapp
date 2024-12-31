part of '../group_view.dart';

class StreamedUserList extends StatelessWidget {
  const StreamedUserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: StreamBuilder<List<types.User>>(
        stream: FirebaseChatCore.instance.users(),
        initialData: const [],
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                bottom: 200,
              ),
              child: const Text('No users'),
            );
          }

          return SelectUser(
            allUsers: snapshot.data!,
          );
        },
      ),
    );
  }
}
