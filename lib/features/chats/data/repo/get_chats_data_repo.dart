import 'package:chat_app/core/api_services/fetch_api_services.dart';
import 'package:chat_app/core/helpers/lists.dart';
import 'package:chat_app/features/chats/data/models/chat_model.dart';
class GetChatsDataRepo {
  FetchApiServices fetchApiServices;

  GetChatsDataRepo(this.fetchApiServices);

  Future<List<ChatModel>> getChatsData() async {
    ChatModel chatModel;
    final chatsData = await fetchApiServices.fetchChatsData();
    listOfChatModel.clear();

    for (var index = 0; index < chatsData.docs.length; index++) {
      final data = chatsData.docs[index].data();
      final id = chatsData.docs[index].id;

      try {
        chatModel = ChatModel.fromFirestore(data);
        listOfChatModel.add(chatModel);
      } catch (e) {
        print("Error parsing document with ID $id: $e");
      }
    }

    print(listOfChatModel.length);
    return listOfChatModel;
  }
}


