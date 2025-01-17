import 'package:chat_app/core/api_services/add_api_services.dart';
import 'package:chat_app/features/chats/data/models/chat_model.dart';


class AddChatsDataRepo {
  AddApiServices addApiServices ;
  AddChatsDataRepo(this.addApiServices);
  Future<bool>addChatsData(ChatModel chatModel )async{
    try{
      await addApiServices.addChatsData("chats" ,"messages",  chatModel) ;
      return true ; 
    }catch(e){
      throw Exception(e.toString());
    }
  }
}