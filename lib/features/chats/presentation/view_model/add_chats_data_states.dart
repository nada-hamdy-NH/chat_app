import 'package:chat_app/features/chats/data/models/chat_model.dart';

class AddChatsDataStates {}
class AddChatsDataStatesinitial extends AddChatsDataStates{} 
class LoadingAddChatsDataState extends AddChatsDataStates{}
class SuccessAddChatsDataState extends AddChatsDataStates{
  ChatModel chatModel;
  SuccessAddChatsDataState(this.chatModel);
}
class ErrorAddChatsDataState extends AddChatsDataStates{
  ErrorAddChatsDataState(String string);
}

  
