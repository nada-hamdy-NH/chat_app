import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/features/chats/presentation/views/chat_view.dart';
import 'package:flutter/material.dart';

class MessageItems extends StatelessWidget {
  final String userImage;
  final String userName;
  final String userMessage;
  final String messageTime;
  const MessageItems({super.key, required this.userImage, required this.userName, required this.userMessage, required this.messageTime});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatView()));
      },
      child: ListTile(
        leading:ClipOval(
          child:Image(image: AssetImage(userImage ),height: 60,width: 60,fit: BoxFit.cover,
      ) ),
      title: Text(userName),
      subtitle: Text(userMessage),
      trailing:  Column(
        children: [
        Text(messageTime),
        verticalSpace(10),
       const CircleAvatar(
        backgroundColor: ColorManager.mainColor,
        radius: 12,
         child: Text("2" , style: TextStyle(color: Colors.white, fontSize: 10),), 
        )
        
      ])  
      
      
      ),
    );
  }
}