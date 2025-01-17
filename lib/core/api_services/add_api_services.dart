import 'package:chat_app/features/chats/data/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddApiServices {
  FirebaseFirestore firebaseFirestore ; 
  AddApiServices( this.firebaseFirestore);
  
  Future<bool>addChatsData(chatCollection  ,messageCollection ,ChatModel chatModel )async{
    try{
       var chatQuery = await firebaseFirestore
        .collection(chatCollection)
        .where( "chatId" , isEqualTo: chatModel.toFirestore()["chatId"]).limit(1).get();
        if(chatQuery.docs.isEmpty){
      var chatRef = firebaseFirestore.collection(chatCollection).doc(chatModel.toFirestore()["chatId"]);
      await chatRef.set(chatModel.toFirestore());
      var messageRef = chatRef.collection(messageCollection).doc(chatModel.toFirestore()["chatId"]);
    chatModel.toFirestore()["messages"][0]["messageId"] = messageRef.id;

      await messageRef.set(chatModel.toFirestore()["messages"][0]);
      return true;
        }else{ ///not empty  
          var chatDocId = chatQuery.docs.first.id;
                     await firebaseFirestore.collection(chatCollection).doc(chatDocId)
                     .update({"lastMessage":chatModel.toFirestore()["messages"][0]["message"],

                     "lastMessageTimestamp":chatModel.toFirestore()["messages"][0]["timestamp"],
                     });
                     print(chatDocId);
                     print(chatModel.toFirestore()["messages"][0]["message"]);
          var messageRef = firebaseFirestore.collection(chatCollection).doc(chatDocId).collection(messageCollection).doc();   
          chatModel.toFirestore()["messages"][0]["messageId"] = messageRef.id;
           await messageRef.set(chatModel.toFirestore()["messages"][0]);
           return true;
          
        }

    }catch(e){
      throw Exception(e.toString());
    }
    
  }
}