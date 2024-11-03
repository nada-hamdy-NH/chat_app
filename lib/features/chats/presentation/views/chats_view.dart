
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/features/calls/presentation/views/calls_view.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/app_bar_widget.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/botton_navigation_bar.dart';


import 'package:flutter/material.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:appBarWidget(),
      body:const CallsView(),
      //const ChatsListView(),
     // const StatusView(),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.mainColor,
        onPressed:(){
        },child: const Icon(Icons.chat , color: Colors.white),),
      );
  }
}
