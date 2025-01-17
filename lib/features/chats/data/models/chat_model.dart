import 'package:chat_app/features/auth/data/models/auth_model.dart';
import 'package:chat_app/features/chats/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String chatId;
  final String lastMessage;
  final DateTime? lastMessageTimestamp;
  final String? numberOfMessages;
  final String type;
  final UserModel receiverInfo;
  final UserModel currentUserData; // Added current user data
  final List<String> users;
  final List<MessageModel> messages;

  ChatModel({
    required this.chatId,
    required this.lastMessage,
    required this.lastMessageTimestamp,
    required this.numberOfMessages,
    required this.type,
    required this.receiverInfo,
    required this.currentUserData,
    required this.users,
    required this.messages,
  });

  /// Factory method to create ChatModel from Firestore data
  factory ChatModel.fromFirestore(Map<String, dynamic> data) {
    return ChatModel(
      chatId: data['chatId'] ?? '',
      lastMessage: data['lastMessage'] ?? '',
      lastMessageTimestamp: (data['lastMessageTimestamp'] as Timestamp?)?.toDate(),
      numberOfMessages: data['numberOfMessages'] ?? '',
      type: data['type'] ?? '',
      receiverInfo: UserModel.fromSnapShots(data['reciverData'] ?? {}),
      currentUserData: UserModel.fromSnapShots(data['currentUserData'] ?? {}),
      users: List<String>.from(data['users'] ?? []),
      messages: [],
    );
  }

  /// Method to convert ChatModel to Firestore-friendly format
  Map<String, dynamic> toFirestore()=> 
     {
      'chatId': chatId,
      'lastMessage': lastMessage,
      'lastMessageTimestamp': lastMessageTimestamp?.toIso8601String(),
      'numberOfMessages': numberOfMessages,
      'type': type,
      'reciverData': receiverInfo.toJson(),
      'currentUserData': currentUserData.toJson(),
      'users': users,
      'messages': messages.map((message) => message.toFirestore()).toList(),
    };
  }

