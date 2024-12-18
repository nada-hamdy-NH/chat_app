import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
   String messageId;
   String senderId;
   String message;
   Timestamp timestamp;
   String type; 

  MessageModel({
    required this.messageId,
    required this.senderId,
    required this.message,
    required this.timestamp,
    required this.type,
  });

  factory MessageModel.fromFirestore(Map<String, dynamic> data) {
    return MessageModel(
      messageId: data['messageId'],
      senderId: data['senderId'],
      message: data['message'],
      timestamp:data['timestamp'],
      type: data['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'senderId': senderId,
      'message': message,
      'timestamp': timestamp,
      'type': type,
    };
  }
}
