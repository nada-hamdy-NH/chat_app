import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class AddStatus extends StatelessWidget {
  const AddStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
            const Stack(
           children: [
           
            ClipOval(
              child: Image(image: AssetImage(AssetsImages.iron),height: 65,width: 65,fit: BoxFit.cover,),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child:  CircleAvatar(backgroundColor: ColorManager.mainColor,radius: 11,
              child:  CircleAvatar(backgroundColor: Colors.white, radius: 9,
              child: Icon(Icons.add,size: 18,color: ColorManager.mainColor,),
              ),),
            ),
           ]

         ),
         horizontalSpace(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("My Status",style: black20semiBold),
                horizontalSpace(10),
                Text("Tap to add status update",style: grey17bold)
              ],
            )
          ],);
  }
}