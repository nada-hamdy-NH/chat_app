
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String chatId;
  List<String> users =[];
  String lastMessage ;
  Timestamp lastMessageTimestamp ; 
  String type ;
  ChatModel({required this.chatId,required this.users,required this.lastMessage , required this.lastMessageTimestamp , required this.type});

  factory ChatModel.fromJson(Map<String , dynamic>json)=>ChatModel(
    chatId: json['chatId'],
     users: (json['users']),
      lastMessage: (json['lastMessage']),
      lastMessageTimestamp: json['lastMessageTimestamp'] , 
      type: json['type']

  );

  Map<String,dynamic>toJson()=>{
    'chatId':chatId,
    'users':users,
    'lastMessage':lastMessage,
    'lastMessageTimestamp':lastMessageTimestamp,
    'type':type
    };
}