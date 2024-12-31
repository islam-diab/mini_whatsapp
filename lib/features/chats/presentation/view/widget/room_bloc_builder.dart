import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chats_shimmer_loading.dart';
import 'room_list_view.dart';
import 'package:mini_whatsapp/features/chats/presentation/view_model/chats_cubit.dart';

class RoomBlocBuilder extends StatelessWidget {
  const RoomBlocBuilder({
    super.key,
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

          return RoomListView(
            rooms: rooms,
            lastMessages: lastMessages,
            lastTimes: state.latestTimes,
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
