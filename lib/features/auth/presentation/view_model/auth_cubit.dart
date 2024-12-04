import 'package:chat_app/features/auth/data/models/auth_model.dart';
import 'package:chat_app/features/auth/data/repo/auth_repo.dart';
import 'package:chat_app/features/auth/presentation/view_model/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates>{
  final AuthRepo authRepo ; 
  AuthCubit(this.authRepo) : super(InitialAuthState());
  
GlobalKey<FormState> formKey = GlobalKey<FormState>();
AuthCubit get(context) => BlocProvider.of(context);

Future<bool> registerUser(String name , String email , String password , String phoneNumber)async{
  LoadingRegisterState();
  try{
    await authRepo.registerUser(UserModel(
      name: name,
     email: email,
     password: password,
      phoneNumber: phoneNumber,
       image: "assets/images/iron.jpeg" 
      ));
       emit( SuccessRegisterState("register successfully"));
       return true ; 

}catch(error){
  emit(ErrorRegisterState(error.toString()));
  return false;
}
}
Future<bool>loginUser(email , password)async{
 emit(LoadingLoginState());
 try{
  await authRepo.loginUser(email, password);
  emit(SuccessLoginState());
  return true;
 }catch(error){
  emit(ErrorLoginState(error.toString()));
  return false;
 }

}

  
}