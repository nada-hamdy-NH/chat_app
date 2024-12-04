import 'package:cloud_firestore/cloud_firestore.dart';

class FetchApiServices {
    FirebaseFirestore firebaseFirestore ;
   FetchApiServices(this.firebaseFirestore);

Future<QuerySnapshot<Map<String, dynamic>>> fetchUsersData() async {

 
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseFirestore.collection("Users").get(); 
 
return querySnapshot ; 

}}