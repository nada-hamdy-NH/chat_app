
import 'package:chat_app/features/chats/data/models/chat_model.dart';
import 'package:chat_app/features/chats/data/repo/add_chats_data_repo.dart';
import 'package:chat_app/features/chats/presentation/view_model/add_chats_data_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddChatsDataCubit extends Cubit<AddChatsDataStates> {
  final AddChatsDataRepo addChatsDataRepo ; 
  AddChatsDataCubit(this.addChatsDataRepo) : super(AddChatsDataStatesinitial());
 
Future<bool>addChatsData(ChatModel? chatModel)async{
  try{
    emit(LoadingAddChatsDataState());
  await addChatsDataRepo.addChatsData(chatModel!);
  emit(SuccessAddChatsDataState(chatModel));
  return true;
  }catch(e){
    emit(ErrorAddChatsDataState(e.toString()));
    throw Exception(e.toString());


  }
}
  
}

