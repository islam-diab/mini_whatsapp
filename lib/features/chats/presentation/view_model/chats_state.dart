part of 'chats_cubit.dart';

@immutable
sealed class ChatsState {}

final class RoomsInitial extends ChatsState {}

final class RoomsLoading extends ChatsState {}

final class RoomsLoaded extends ChatsState {
  final List<types.Room> rooms;
  final List<String> lastMessage;
  final List<String> latestTimes;
  final List<bool> isCurrentUserSender;
  RoomsLoaded(
    this.rooms,
    this.lastMessage,
    this.latestTimes,
    this.isCurrentUserSender,
  );
}

final class RoomsError extends ChatsState {
  final String message;
  RoomsError(this.message);
}
