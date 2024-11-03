import 'package:chat_app/core/themes/colos.dart';
import 'package:flutter/material.dart';

BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
  elevation: 0,
  currentIndex: 0,
  selectedItemColor: ColorManager.mainColor ,
  selectedLabelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  backgroundColor: Colors.white,
  items: [
     BottomNavigationBarItem(
      icon: IconButton(onPressed:(){
        //currentIndex = 0;
      }, icon:const Icon(Icons.chat) , color: ColorManager.mainColor ,iconSize: 32, ),
      label:"Chats",
      //activeIcon:const HomeView()
    ),
    BottomNavigationBarItem(
      icon: IconButton(
        onPressed: (){
         //  currentIndex = 1 ;
        },
        icon:const Icon( Icons.tips_and_updates) , color: ColorManager.mainColor,iconSize: 32, ),
      label:"Status", 
    ),
    BottomNavigationBarItem(
      icon: IconButton(
        onPressed: (){
        },
        icon:const Icon(Icons.call ), color: ColorManager.mainColor,iconSize: 32, ),
      label:"Calls",
      
    )

  ],
  

);


  
