import 'package:chat_app/core/api_services/auth_api_services.dart';
import 'package:chat_app/core/helpers/strings.dart';
import 'package:chat_app/features/auth/data/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepo {
  final AuthServices authServices ; 
  AuthRepo(this.authServices);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   Future<UserCredential> registerUser(UserModel userModel ) async {
    try {
        UserCredential  credential =await  authServices.registerUser(userModel);
        userModel.uid = credential.user!.uid;
      await _storeUserDataInFirestore(credential.user!.uid, userModel);
      return credential;  
    } on FirebaseAuthException catch (e) {
       throw Exception('Error: ${e.message}');
      }  catch (e) {
      throw Exception('An unknown error occurred.');
    }
  }



   Future<UserCredential>loginUser(String email,String password)async{
  try {
   UserCredential credential = await authServices.loginUser(email, password);
   currentUserId = credential.user!.uid;
  return credential;
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