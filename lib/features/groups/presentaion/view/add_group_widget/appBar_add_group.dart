import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

AppBar appBar =  AppBar(
        backgroundColor: Colors.white,
        title: Text("New Group",style:black2Bold),
         actions: [IconButton(
          onPressed: (){},
         icon: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 15.0),
           child: Stack(
             children:[ Container(
              width: 40,
              height:40 ,
              decoration:const BoxDecoration(
                color: Color.fromARGB(255, 231, 234, 237),
                borderRadius:BorderRadius.all(Radius.circular(13)),
                ),
              child: const Icon(Icons.search , size: 30, color: ColorManager.mainColor,)),]
           ),
         ))],
       );