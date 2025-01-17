import 'package:chat_app/features/auth/data/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  AuthServices(this.firebaseAuth);

  FirebaseAuth firebaseAuth = FirebaseAuth.instance ; 
  
  Future<UserCredential> registerUser(UserModel userModel ) async {
    try {
      final UserCredential credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password!
      );
      return credential;  
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      } else {
        throw Exception('Error: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unknown error occurred.');
    }
  }




Future<UserCredential>loginUser(String email,String password)async{
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  return credential;
} on FirebaseAuthException catch (e) {

  if (e.code == 'user-not-found') {
    throw Exception('No user found for that email.');
  
  } else if (e.code == 'wrong-password') {
    throw Exception('Wrong password provided for that user.');
  }
}
 throw Exception('Login failed for an unknown reason.');
  
  
  }

  


}