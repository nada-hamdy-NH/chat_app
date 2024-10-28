import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar appBar =AppBar(
backgroundColor: Colors.white,
  title: Padding(
    padding: EdgeInsets.only(left: 25.w,),
    child: Text("WhatsUp",style: black28W500),
  ),
  actions: [
     IconButton(onPressed: (){}, icon: const Icon(Icons.search , size: 30,)),
      IconButton(onPressed: (){
      }, icon: const Icon(Icons.more_vert_sharp , size: 30,)),
  ],
bottom: const PreferredSize(preferredSize: Size.fromHeight(25),
 child: Divider(color: Colors.black,thickness: 0.030,),),
  
);