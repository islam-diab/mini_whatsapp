import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:intl/intl.dart';
import 'package:mini_whatsapp/core/model/api_result.dart';
import 'package:mini_whatsapp/features/chats/data/chats_repository.dart';
import 'package:mini_whatsapp/features/chats/data/message_model.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  final ChatsRepository homeDataSource;
  ChatsCubit(this.homeDataSource) : super(RoomsInitial());

  void fetchRooms() {
    try {
      emit(RoomsLoading());

      FirebaseChatCore.instance.rooms().listen((rooms) async {
        if (rooms.isEmpty) {
          emit(RoomsError("No rooms available."));
          return;
        }

        List<String> latestMessages = [];
        List<String> latestTimes = [];
        List<bool> isCurrentUserSender = [];

        for (var room in rooms) {
          ApiResult result = await homeDataSource.getChatsInfo(room.id);
          if (result.isError) {
            emit(RoomsError(result.value.toString()));
            return;
          }
          MessageModel message = result.value;

          latestMessages.add(message.text);
          latestTimes.add(formatTime(message.updatedAt));
          isCurrentUserSender
              .add(checkIfCurrentUserSendTheMessage(message.authorId));
        }

        emit(RoomsLoaded(
            rooms, latestMessages, latestTimes, isCurrentUserSender));
      });
    } catch (e) {
      emit(RoomsError(e.toString()));
    }
  }

  String formatTime(Timestamp timestamp) {
    DateTime time = timestamp.toDate();
    return DateFormat('dd/MM hh:mm a').format(time);
  }

  bool checkIfCurrentUserSendTheMessage(String userId) {
    return auth.FirebaseAuth.instance.currentUser?.uid == userId;
  }
}
