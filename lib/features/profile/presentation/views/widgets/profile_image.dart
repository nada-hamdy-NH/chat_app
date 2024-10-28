import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return     SizedBox(
              height: 180.h,
              width: double.infinity,
         child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
           Stack(
           children: [
              ClipOval(child: Image.asset(AssetsImages.iron,height: 135.h,width: 135.w,fit: BoxFit.cover,),),
             const Positioned(
                bottom: 0,
                right: 0,
                child:  CircleAvatar(backgroundColor: ColorManager.mainColor,radius: 20,
                child:Icon(Icons.add_a_photo,size: 22,color: Colors.white),)
              )

           ]
         ),
            ],
          ),
          );
  }
}