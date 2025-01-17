import 'package:chat_app/features/chats/data/models/chat_model.dart';
import 'package:chat_app/features/chats/presentation/view_model/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  void toggleSearchMode() {
    emit(state.copyWith(isSearching: !state.isSearching));
  }

  void toggleOnChangeMode( bool isChangeMode) {
    emit(OnChangeMode(isChangeMode: isChangeMode),
    );
  }

  void updateSearchList(String query, final List<ChatModel> unSearchChats ) {
    final searchText = query.toLowerCase();
    final filteredList = unSearchChats.where((chat) {
      final name = chat.receiverInfo.name;
      return name.toLowerCase().contains(searchText);
    }).toList();

    emit(state.copyWith(searchList: filteredList));
  }
}