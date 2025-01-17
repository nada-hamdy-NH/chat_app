import 'package:chat_app/features/chats/data/repo/get_chats_data_repo.dart';
import 'package:chat_app/features/chats/presentation/view_model/get_chats_data_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetChatsDataCubit extends Cubit<GetChatsDataStates>{
  GetChatsDataRepo getChatsDataRepo ; 
  GetChatsDataCubit(this.getChatsDataRepo): super( initialGetChatsDataState()); 

  Future<void> getChatsData()async{
    try{
    emit(GetChatsDataLoadingState());
      final chatsListViewData =    await getChatsDataRepo.getChatsData();
      print(chatsListViewData.length);
      if(chatsListViewData.isNotEmpty) {
      emit(GetChatsDataSuccessState(chatsListViewData:chatsListViewData ));
      }
    }catch(e){
     throw Exception(e.toString()); 
    }
  }

}

