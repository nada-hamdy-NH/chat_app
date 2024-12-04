class AuthStates {}
class InitialAuthState extends AuthStates{}
class LoadingRegisterState extends AuthStates{}
class SuccessRegisterState extends AuthStates{
 // String? successMsg ; 
  SuccessRegisterState(String successMsg);
}
class ErrorRegisterState extends AuthStates{
  ErrorRegisterState(String error);
}
class LoadingLoginState extends AuthStates{}
class SuccessLoginState extends AuthStates{}
class ErrorLoginState extends AuthStates{
  ErrorLoginState(String error);
}
