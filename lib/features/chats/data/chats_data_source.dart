import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_whatsapp/core/model/api_result.dart';

import 'package:mini_whatsapp/features/chats/data/message_model.dart';

class ChatsDataSource {
  // get chats information
  Future<ApiResult> getChatsInfo(String roomId) async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection('rooms')
          .doc(roomId)
          .collection('messages')
          .orderBy('updatedAt', descending: true)
          .limit(1)
          .get();

      if (snap.docs.isNotEmpty) {
        MessageModel message = MessageModel.fromJson(snap.docs.first.data());
        return ApiResult(value: message, isError: false);
      } else {
        return ApiResult(
            value: 'No messages found for this room', isError: false);
      }
    } catch (e) {
      return ApiResult(value: e.toString(), isError: true);
    }
  }
}
