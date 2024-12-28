import 'package:cloud_firestore/cloud_firestore.dart';

class RoomModel {
  final Timestamp updatedAt;
  final List<String> userIds;
  final List<MessageModel>? messages;

  RoomModel({
    required this.userIds,
    required this.updatedAt,
    this.messages,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      updatedAt: json['updatedAt'],
      userIds: List<String>.from(json['userIds']),
    );
  }
}

class MessageModel {
  final Timestamp updatedAt;
  final String text, authorId;

  MessageModel(
      {required this.updatedAt, required this.text, required this.authorId});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      updatedAt: json['updatedAt'],
      text: json['text'],
      authorId: json['authorId'],
    );
  }
}
