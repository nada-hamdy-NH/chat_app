import 'dart:async';
import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          Navigator.pushReplacement(context, MaterialPageRoute( builder:(context)=>const LoginView()));
        });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Center(child: Image.asset(AssetsImages.splashLogo , fit:BoxFit.fill,width: 250.w,height: 250.h,)),
            Text("WhatsUp",style:mainColor34Bold,),
             verticalSpace(140),
              Text("the best chat app of this century",style:black23Normal,),
                           
       ] )),
    );
  }
}