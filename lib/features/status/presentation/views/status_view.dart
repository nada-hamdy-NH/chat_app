import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/status/presentation/views/widgets/add_status.dart';
import 'package:chat_app/features/status/presentation/views/widgets/recent_updates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const  EdgeInsets.only(left: 20,right: 20,top: 5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
          
         const  AddStatus(),
          verticalSpace(30),
          Text("Recent updates",style: grey17bold,),
         RecentUpdates(circleAvatarColor: ColorManager.mainColor,sizeBoxHeight: 300.h),
          verticalSpace(20),
         Text("Viewed updates",style: grey17bold,),
         RecentUpdates(circleAvatarColor: Colors.grey,sizeBoxHeight: 300.h,),

        
           
          
          ]
        ),
      ),
    );
  }
}