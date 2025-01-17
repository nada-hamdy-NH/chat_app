import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String messageId;
  final String message;
  final String senderId;
  final DateTime? timestamp;
  final String type;

  MessageModel({
    required this.messageId,
    required this.message,
    required this.senderId,
    required this.timestamp,
    required this.type,
  });

  // Factory method to create a MessageModel from Firestore data
  factory MessageModel.fromFirestore(Map<String, dynamic> data, String id) {
    return MessageModel(
      messageId: id,
      message: data['message'] ?? '',
      senderId: data['senderId'] ?? '',
      timestamp: (data['timestamp'] as Timestamp?)?.toDate(),
      type: data['type'] ?? 'text',
    );
  }

  // Method to convert MessageModel to a Firestore-friendly format
  Map<String, dynamic> toFirestore() {
    return {
      'message': message,
      'senderId': senderId,
      'timestamp': timestamp,
      'type': type,
    };
  }
}
