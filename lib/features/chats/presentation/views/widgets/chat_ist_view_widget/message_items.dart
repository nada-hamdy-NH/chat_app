import 'package:chat_app/core/di/dependency_injection.dart';
import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/features/chats/data/models/chat_model.dart';
import 'package:chat_app/features/chats/presentation/view_model/add_chats_data_cubit.dart';
import 'package:chat_app/features/chats/presentation/view_model/add_chats_data_states.dart';
import 'package:chat_app/features/chats/presentation/views/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MessageItems extends StatelessWidget {
  final ChatModel chatData;
  
  const MessageItems({super.key, required this.chatData});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocProvider(create: (context) =>getIt<AddChatsDataCubit>(),
                          child: ChatView(
                                    receiverData:chatData.receiverInfo,
                                    currentUserData: chatData.currentUserData,
                                    
                                  ),
                                ),));
      },
      child:  BlocBuilder<AddChatsDataCubit, AddChatsDataStates>(
        builder: (context, state) {
          String lastMessage = chatData.lastMessage;
          DateTime? lastMessageTimestamp = chatData.lastMessageTimestamp;

          if (state is SuccessAddChatsDataState) {
            lastMessage = state.chatModel.lastMessage ;
            lastMessageTimestamp = state.chatModel.lastMessageTimestamp ?? lastMessageTimestamp;
          }

          return  ListTile(
          leading:ClipOval(
            child:Image(image: AssetImage(chatData.receiverInfo.image ),height: 60,width: 60,fit: BoxFit.cover,
        ) ),
        title: Text(chatData.receiverInfo.name),
        subtitle: Text(
        
          lastMessage ),
        trailing:  Column(
          children: [
          Text(DateFormat.jm().format(lastMessageTimestamp! )
        ,style: const TextStyle(color: Colors.grey),),
          verticalSpace(10),
         const CircleAvatar(
          backgroundColor: ColorManager.mainColor,
          radius: 12,
           child: Text("2" , style: TextStyle(color: Colors.white, fontSize: 10),), 
          )
          
        ])  
        
        
        );}
      ),
    );
  }
}