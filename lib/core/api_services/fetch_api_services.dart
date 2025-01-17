
import 'package:cloud_firestore/cloud_firestore.dart';

class FetchApiServices {
    FirebaseFirestore firebaseFirestore ;
   FetchApiServices(this.firebaseFirestore);

Future<QuerySnapshot<Map<String, dynamic>>> fetchUsersData() async {

 
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseFirestore.collection("Users").get(); 
 
return querySnapshot ; 

}
Future<Map<String, dynamic>?> fetchUserData(String currentUserId) async {

 
  final querySnapshot = await firebaseFirestore.collection("Users").doc(currentUserId).get();
 final userData = querySnapshot.data();

return userData ; 
}


Future<QuerySnapshot<Map<String, dynamic>>> fetchChatsData() async {
  try{
     final  chatsData = await firebaseFirestore.collection("chats").get();
     print(chatsData.docs.length);
       return chatsData;
  }catch(e){
    throw Exception(e.toString());
  }
   
}





}