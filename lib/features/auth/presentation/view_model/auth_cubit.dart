import 'package:chat_app/features/auth/data/models/auth_model.dart';
import 'package:chat_app/features/auth/data/repo/auth_repo.dart';
import 'package:chat_app/features/auth/presentation/view_model/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates>{
  final AuthRepo authRepo ; 
  late UserModel currentUserData ;
  AuthCubit(this.authRepo ,) : super(InitialAuthState());
  
GlobalKey<FormState> formKey = GlobalKey<FormState>();
AuthCubit get(context) => BlocProvider.of(context);

registerUser(String uid, String name , String email , String password , String phoneNumber)async{
  LoadingRegisterState();
  try{
    currentUserData=UserModel(
      uid: uid,
      name: name,
     email: email,
     password: password,
      phoneNumber: phoneNumber,
       image: "assets/images/iron.jpeg" 
      );

    await authRepo.registerUser(currentUserData);
      emit( SuccessRegisterState("register successfully" , currentUserData));

}catch(error){
  emit(ErrorRegisterState(error.toString()));
}
}
loginUser(email , password)async{
 emit(LoadingLoginState());
 try{
  currentUserData  = await authRepo.loginUser(email, password);
  emit(SuccessLoginState(currentUserData));
  
 }catch(error){
  emit(ErrorLoginState(error.toString()));
 }

}

  
}