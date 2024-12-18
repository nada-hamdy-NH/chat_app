
import 'package:cloud_firestore/cloud_firestore.dart';


class AddApiServices {
  FirebaseFirestore firebaseFirestore ; 
  AddApiServices( this.firebaseFirestore);
  
  Future<bool>addChatsData(chatCollection,currentUserId, receiverId ,messageCollection , chatModel , messageModel)async{
    try{

      String chatId = currentUserId.compareTo(receiverId) < 0 ?
      "$currentUserId-$receiverId" : "$receiverId-$currentUserId" ; 

       var chatQuery = await firebaseFirestore
        .collection(chatCollection)
        .where( "chatId" , isEqualTo: chatId).limit(1).get();
        if(chatQuery.docs.isEmpty){
  
      var chatRef = firebaseFirestore.collection(chatCollection).doc(chatId);
      chatModel.chatId = chatRef.id;

      await chatRef.set(chatModel.toJson());

      var messageRef = chatRef.collection(messageCollection).doc(chatId);
      messageModel.messageId =messageRef.id;

      await messageRef.set(messageModel.toJson());
      return true;
        }else{ ///not empty  
          var chatDocId = chatQuery.docs.first.id;
          var messageRef = firebaseFirestore.collection(chatCollection).doc(chatDocId).collection(messageCollection).doc();   
          messageModel.messageId =messageRef.id;
           await messageRef.set(messageModel.toJson());
           return true;
          
        }

    }catch(e){
      throw Exception(e.toString());
    }
    
  }
}