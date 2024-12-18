import 'package:chat_app/core/helpers/strings.dart';
import 'package:chat_app/features/chats/data/models/chat_model.dart';
import 'package:chat_app/features/chats/data/models/message_model.dart';
import 'package:chat_app/features/chats/presentation/view_model/add_chats_data_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMessageButton extends StatelessWidget {
  final TextEditingController messageController ;
  final String receiverId ;
  final Function(MessageModel) onMessageAdded;
  final Function() scrollToBottom;
  const AddMessageButton({super.key , required this.messageController, required this.receiverId, required this.onMessageAdded, required this.scrollToBottom});
 
  @override
  Widget build(BuildContext context) {
    return IconButton(
                            onPressed: () {
                              
                               if (messageController.text.isNotEmpty) {
                                 final  newMessage = MessageModel(messageId: "" , 
                                  senderId: currentUserId ,
                                   message:messageController.text ,
                                    timestamp: Timestamp.now() ,
                                     type: "text");
                                  onMessageAdded(newMessage);
                                   context.read<AddChatsDataCubit>().addChatsData(
                                      ChatModel(chatId: "1", users:[currentUserId ,receiverId ]  ,
                                       lastMessageTimestamp: Timestamp.now() ,
                                       lastMessage:messageController.text , 
                                       type: "private"
                                       ),
                                       newMessage , currentUserId , receiverId 
                                   );
                                   messageController.clear();
                                   scrollToBottom();
                               }
                            },
                            icon: const Icon(Icons.send, color: Colors.white),
                          );
  }
}