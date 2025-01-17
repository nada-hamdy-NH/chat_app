import 'package:chat_app/core/di/dependency_injection.dart';
import 'package:chat_app/features/chats/data/models/chat_model.dart';
import 'package:chat_app/features/chats/presentation/view_model/add_chats_data_cubit.dart';
import 'package:chat_app/features/chats/presentation/view_model/search_cubit.dart';
import 'package:chat_app/features/chats/presentation/view_model/search_states.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/chat_ist_view_widget/message_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsListView extends StatelessWidget {
  final List<ChatModel> unSearchChats ;
 const  
 ChatsListView({super.key, required this.unSearchChats});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child:  BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
            final displayedListtile = state.isSearching ? state.searchList : unSearchChats;
            print(displayedListtile.length);
            return ListView.builder(
                itemCount: displayedListtile.length,
                itemBuilder: (context, index) {
                  final chat = displayedListtile[index];
                  return BlocProvider(
                    create:(context)=>getIt<AddChatsDataCubit>(),
                     child: MessageItems(chatData: chat));
                });
          })
      ),
    
    ]);
  }
}
