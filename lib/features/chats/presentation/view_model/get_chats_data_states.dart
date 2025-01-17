import 'package:chat_app/features/chats/data/models/chat_model.dart';

class GetChatsDataStates {}
class initialGetChatsDataState extends GetChatsDataStates{}
class GetChatsDataLoadingState extends GetChatsDataStates{}
class GetChatsDataSuccessState extends GetChatsDataStates{
  List<ChatModel> chatsListViewData;
  GetChatsDataSuccessState({required this.chatsListViewData});
}