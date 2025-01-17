import 'package:chat_app/core/api_services/auth_api_services.dart';
import 'package:chat_app/core/api_services/fetch_api_services.dart';
import 'package:chat_app/features/auth/data/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepo {
  final AuthServices authServices ; 
  final FetchApiServices fetchApiServices;
  AuthRepo(this.authServices, this.fetchApiServices,);


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> registerUser(UserModel userModel ) async {
    try {
        UserCredential  credential =await  authServices.registerUser(userModel);
        userModel.uid = credential.user!.uid;
      await _storeUserDataInFirestore(credential.user!.uid, userModel);
    } on FirebaseAuthException catch (e) {
       throw Exception('Error: ${e.message}');
      }  catch (e) {
      throw Exception('An unknown error occurred.');
    }
  }



   Future<UserModel>loginUser(String email,String password )async{
  try {
  final  credential =  await authServices.loginUser(email, password);
  final userData =  await fetchApiServices.fetchUserData(credential.user!.uid);
   UserModel currentUserData  =UserModel.fromSnapShots(userData!);
    return currentUserData ; 
} on FirebaseAuthException catch (e) {
    throw Exception('Error: ${e.message}');
}
  }
  
  

  

  Future<void> _storeUserDataInFirestore(String uid,userModel) async {
    await _firestore.collection('Users').doc(uid).set({
      'uid':userModel.uid,
       'name':userModel.name,
      'email':userModel.email,
      'phone':userModel.phoneNumber,
      'password':userModel.password,
      'image':userModel.image
    
    });
    DocumentSnapshot userDoc = await _firestore.collection('Users').doc(uid).get();
    print(userDoc['name']);
  }
 }