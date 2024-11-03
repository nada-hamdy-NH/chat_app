import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/helpers/lists.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/message_items.dart';
import 'package:flutter/material.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({super.key});

  @override
  Widget build(BuildContext context) {
     List<User> user =[
       User(image: AssetsImages.iron,name: 'John Doe', lastMessage: 'Hello', date: '10:00 PM'),
       User(image:  AssetsImages.iron,name: 'John Doe', lastMessage: 'Hello', date: '10:00 PM'),
       User(image:  AssetsImages.iron,name: 'John Doe', lastMessage: 'Hello', date: '10:00 PM'),
       User(image:  AssetsImages.iron,name: 'John Doe', lastMessage: 'Hello', date: '10:00 PM'),
       User(image:  AssetsImages.iron,name: 'John Doe', lastMessage: 'Hello', date: '10:00 PM'),
    ];
    return  Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: user.length,
            itemBuilder: (context, index) => MessageItems( 
              userImage: user[index].image,
              userName: user[index].name,
              userMessage: user[index].lastMessage,
              messageTime: user[index].date
              ),
          ),
        )
        
      
      ]);
  }
}