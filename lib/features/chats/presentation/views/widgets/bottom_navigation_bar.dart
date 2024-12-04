import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/features/chats/presentation/view_model/botton_navigation_bar_cubit.dart';
import 'package:flutter/material.dart';


   BottomNavigationBar bottomNavigationBar =       BottomNavigationBar(
  elevation: 0,
  currentIndex:BottomNaviationBarCubit().currentIndex,
  selectedItemColor: ColorManager.mainColor ,
  selectedLabelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  backgroundColor: Colors.white,
  onTap: (value) {
    
    BottomNaviationBarCubit().changeIndex(value);
    print(BottomNaviationBarCubit().changeIndex(value));
  },
  items:const [
     BottomNavigationBarItem(
     icon: Icon(Icons.chat , color: ColorManager.mainColor ,size: 32,),
      label:"Chats",),
    BottomNavigationBarItem(
        icon: Icon( Icons.tips_and_updates , color: ColorManager.mainColor,size: 32, ),
      label:"Status", 
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.call , color: ColorManager.mainColor,size: 32, ),
      label:"Calls", 
    )

  ],
  

);


  



          
