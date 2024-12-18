import 'package:chat_app/core/api_services/add_api_services.dart';
import 'package:chat_app/features/chats/data/models/chat_model.dart';
import 'package:chat_app/features/chats/data/models/message_model.dart';


class AddChatsDataRepo {
  AddApiServices addApiServices ;
  AddChatsDataRepo(this.addApiServices);
  Future<bool>addChatsData(ChatModel chatModel , MessageModel messageModel , String currentUserId , String receiverId)async{
    try{
      await addApiServices.addChatsData("chats" ,currentUserId ,receiverId ,"messages",  chatModel,messageModel) ;
      return true ; 
    }catch(e){
      throw Exception(e.toString());
    }
  }
}