
import 'package:chat_app/features/auth/data/models/auth_model.dart';

class ShowContactStates {}
class InitialShowContactState extends ShowContactStates{}
class LoadingShowContactState extends ShowContactStates{}
class SuccessShowContactState extends ShowContactStates{
  final List<UserModel>userData ; 
  SuccessShowContactState( this.userData);
  
}
