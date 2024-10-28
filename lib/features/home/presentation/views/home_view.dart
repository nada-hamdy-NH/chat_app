
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/features/calls/presentation/views/calls_view.dart';
import 'package:chat_app/features/home/presentation/views/widgets/app_bar_widget.dart';
import 'package:chat_app/features/home/presentation/views/widgets/botton_navigation_bar.dart';
import 'package:chat_app/features/profile/presentation/views/profile_view.dart';
import 'package:chat_app/features/status/presentation/views/status_view.dart';


import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:appBar,
      body:const CallsView(),
      //const ChatsListView(),
     // const StatusView(),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.mainColor,
        onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileView()));
        },child: const Icon(Icons.chat , color: Colors.white),),
      );
  }
}
