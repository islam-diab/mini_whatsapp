part of '../room_view.dart';

class RoomBlocBuilder extends StatelessWidget {
  final bool isOnline;
  const RoomBlocBuilder({
    super.key,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        if (state is RoomsLoading) {
          return const Expanded(child: ChatsShimmerLoading());
        } else if (state is RoomsError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is RoomsLoaded) {
          final rooms = state.rooms;
          final lastMessages = state.lastMessage;

          return UserListView(
            rooms: rooms,
            lastMessages: lastMessages,
            lastTimes: state.latestTimes,
            isOnline: isOnline,
            isCurrentUserSender: state.isCurrentUserSender,
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: const Text("No rooms yet"),
          );
        }
      },
    );
  }
}
