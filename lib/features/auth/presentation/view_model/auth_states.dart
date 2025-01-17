import 'package:chat_app/features/auth/data/models/auth_model.dart';

class AuthStates {}
class InitialAuthState extends AuthStates{}
class LoadingRegisterState extends AuthStates{}
class SuccessRegisterState extends AuthStates{
 // String? successMsg ; 
 UserModel? currentUserData ;
  SuccessRegisterState(String successMsg , UserModel currentUserData);
}
class ErrorRegisterState extends AuthStates{
  ErrorRegisterState(String error);
}
class LoadingLoginState extends AuthStates{}
class SuccessLoginState extends AuthStates{
  UserModel currentUserData ; 
  SuccessLoginState(this.currentUserData);
}
class ErrorLoginState extends AuthStates{
  ErrorLoginState(String error);
}
