import 'package:chat_app/core/api_services/fetch_api_services.dart';
import 'package:chat_app/features/auth/data/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ShowContactRepo {
  FetchApiServices fetchApiServices ; 
  ShowContactRepo(this.fetchApiServices);

  
  Future<List<UserModel>> fetchUsersData(List<UserModel> userData) async {
    try{
  final  querySnapshot = await fetchApiServices.fetchUsersData();
  if(querySnapshot.docs.isNotEmpty){
     userData.clear;
for (var elemrnt in querySnapshot.docs) {
     if(elemrnt.id != FirebaseAuth.instance.currentUser!.uid){
         userData.add(UserModel.fromSnapShots(elemrnt.data()));
     }
     
      
  }
  return userData;

}}catch(e){ 
  throw Exception(e.toString());
}
return [];


}
}