import 'package:chat_app/core/helpers/lists.dart';
import 'package:chat_app/features/show_contact/data/repo/show_contact_repo.dart';
import 'package:chat_app/features/show_contact/presentation/view_model/show_contact_states.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class ShowContactCubit extends Cubit<ShowContactStates>{
  ShowContactRepo showContactRepo ;
  ShowContactCubit(this.showContactRepo) : super(InitialShowContactState());
  


Future<bool> showContact()async{
  emit(LoadingShowContactState());
  try{
   userData =  await showContactRepo.fetchUsersData(userData);
   emit(SuccessShowContactState(userData));
   return true;

  }catch(e){
    print(e.toString());
    return false;
    
  }

}

  static get(BuildContext context) {}

  

}