part of 'group_cubit.dart';

@immutable
sealed class GroupState {}

final class GroupInitial extends GroupState {}

final class GroupLoading extends GroupState {}

final class GroupLoaded extends GroupState {
  final types.Room room;

  GroupLoaded({required this.room});
}

final class GroupError extends GroupState {
  final String message;

  GroupError(this.message);
}
