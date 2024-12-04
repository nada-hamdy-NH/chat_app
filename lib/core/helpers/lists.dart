import 'package:chat_app/features/auth/data/models/auth_model.dart';
import 'package:chat_app/features/chats/data/models/chat_model.dart';

class User{
  String name ;
  String image ;
  String lastMessage ;
  String date ;
User({required this.name , required this.image , required this.lastMessage ,required this.date});
}

class PersonStatus{
String  name ;
String image ;
String date;
String time ; 
PersonStatus({required this.name , required this.image , required this.date , required this.time});
}

List <ChatModel>chatMessages=[];

List<UserModel>userData = [];

