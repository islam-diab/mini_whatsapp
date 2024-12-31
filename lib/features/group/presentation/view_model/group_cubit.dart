import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  TextEditingController groupNameController = TextEditingController();
  List<types.User> usersInGroup = [];
  GroupCubit() : super(GroupInitial());

  void createGroup() async {
    try {
      if (groupNameController.text.isEmpty) {
        emit(GroupError('Group name cannot be empty'));
        return;
      }
      if (usersInGroup.isEmpty) {
        emit(GroupError('Select at least one user'));
        return;
      }
      emit(GroupLoading());
      final room = await FirebaseChatCore.instance
          .createGroupRoom(name: groupNameController.text, users: usersInGroup);
      emit(GroupLoaded(room: room));
    } on Exception catch (e) {
      emit(GroupError(e.toString()));
    }
  }
}
