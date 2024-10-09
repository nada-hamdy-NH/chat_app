import 'dart:async';
import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
        Timer(const Duration(seconds: 3),
        (){
          Navigator.pushReplacement(context, MaterialPageRoute( builder:(context)=>const HomeScreen()));
        });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Center(child: Image.asset(AssetsImages.splashLogo , fit:BoxFit.fill,width: 150,height: 150,)),
            verticalSpace(10),
            Text("WhatsUp",style:mainColor34Bold,),
             verticalSpace(150),
              Text("the best chat app of this century",style:Black17Bold,),
                           
       ] )),
    );
  }
}