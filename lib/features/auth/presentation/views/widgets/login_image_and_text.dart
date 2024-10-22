import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginImageAndText extends StatelessWidget {
  const LoginImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:[ Container(
          height: 250.h,
          width: 250.w,
          decoration:  const BoxDecoration(
            image:  DecorationImage(
              image:  AssetImage(AssetsImages.login_image),
              fit:  BoxFit.fill,
        ))),
        Text("Log in to your account",style:black28Bold
      ),
          ]
      ),
    );
      
    
  }
}