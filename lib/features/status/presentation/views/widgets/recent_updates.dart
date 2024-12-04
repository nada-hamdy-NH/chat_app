import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/helpers/lists.dart';
import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentUpdates extends StatelessWidget {
  final Color circleAvatarColor ;
  final double? sizeBoxHeight ;
  final Icon? callIcon;
  const RecentUpdates({super.key, required this.circleAvatarColor,this.sizeBoxHeight, this.callIcon});
 
  @override
  Widget build(BuildContext context) {
    List<PersonStatus> recentStatus =[
  PersonStatus(image: AssetsImages.iron,name: 'John Doe',date:'Today', time: '10:00 PM'),
  PersonStatus(image: AssetsImages.iron,name: 'John Doe',date:'Today', time: '10:00 PM'),
  PersonStatus(image: AssetsImages.iron,name: 'John Doe',date:'Today', time: '10:00 PM'),
  PersonStatus(image: AssetsImages.iron,name: 'John Doe',date:'Today', time: '10:00 PM'),
  PersonStatus(image: AssetsImages.iron,name: 'John Doe',date:'Today', time: '10:00 PM'),
  PersonStatus(image: AssetsImages.iron,name: 'John Doe',date:'Today', time: '10:00 PM'),
];
    return SizedBox(
      height: sizeBoxHeight,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: recentStatus.length,
        itemBuilder: (context, index) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(20),
            Row(
              children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor:circleAvatarColor,
                  radius: 32,
                  child: ClipOval(child: Image(image: AssetImage(recentStatus[index].image),height: 60,width: 60,fit: BoxFit.cover,),),
                  )
              ],
            ),
            horizontalSpace(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(recentStatus[index].name,style: black20semiBold,),
                verticalSpace(5),
                Text('${recentStatus[index].date}, ${recentStatus[index].time}',style: grey17bold,),
              ]
            ),
           SizedBox(width: 115.w,),
            sizeBoxHeight == 300.h ? const SizedBox() :
            const Icon(Icons.call,color: ColorManager.mainColor,),
            ],)
          
          ,verticalSpace(15),
          ]
        ),
      ),
    );
  }
}