import 'package:chat_app/features/auth/data/models/auth_model.dart';
import 'package:chat_app/features/chats/data/models/chat_model.dart';
import 'package:chat_app/features/chats/data/models/message_model.dart';
import 'package:chat_app/features/chats/presentation/view_model/add_chats_data_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMessageButton extends StatelessWidget {
  final String chatId ; 
  final TextEditingController messageController ;
  final  UserModel currentUserData ;
  final  UserModel receiverData ;
  final Function(MessageModel) onMessageAdded;
  final Function() scrollToBottom;
  final String Function() getNumberOfMessages;
  const AddMessageButton({super.key ,
  required this.chatId,
   required this.messageController,
    required this.receiverData,
    required this.currentUserData,
   required this.onMessageAdded,
    required this.scrollToBottom,
     required this.getNumberOfMessages});
 
  @override
  Widget build(BuildContext context) {
    return IconButton(
                            onPressed: () {
                               if (messageController.text.isNotEmpty) {
                                 final  newMessage = MessageModel(messageId: "" , 
                                  senderId: currentUserData.uid ,
                                   message:messageController.text ,
                                    timestamp: Timestamp.now().toDate() ,
                                     type: "text");

                                  onMessageAdded(newMessage);
                                   context.read<AddChatsDataCubit>().addChatsData(
                                      ChatModel(
                                        chatId: chatId,
                                         users:[  currentUserData.uid,receiverData.uid],  
                                      currentUserData: currentUserData ,
                                      receiverInfo: receiverData,
                                       lastMessageTimestamp: Timestamp.now().toDate(),
                                       lastMessage:messageController.text , 
                                       type: "private",
                                       numberOfMessages:getNumberOfMessages(),
                                       messages: [newMessage]
                                        )

                                      
                                        
                                   );
                                   messageController.clear();
                                   scrollToBottom();
                               }
                            },
                            icon: const Icon(Icons.send, color: Colors.white),
                          );
  }
}