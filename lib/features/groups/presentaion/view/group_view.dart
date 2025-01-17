import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/helpers/lists.dart';
import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/groups/presentaion/view/group_chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupView extends StatelessWidget {
  const GroupView({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("New Group",style:black23Bold),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(children: [
            ClipOval(
              child: Image(image:const AssetImage(AssetsImages.iron ), fit: BoxFit.cover,width: 60.w,height: 60.h,),
            ),
            horizontalSpace(10),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border:Border.all(color: ColorManager.mainColor,width: 2)
              ),
              child: TextField(
                
                decoration: InputDecoration(
                 border:  InputBorder.none,
                  contentPadding:const  EdgeInsets.all( 15),
              hintText: "Group Name",
              hintStyle: grey15Normal,
             
              suffixIcon: IconButton(onPressed: (){}, icon:Icon (Icons.emoji_emotions_outlined , color: Colors.grey,))
                          ),
              ),
            )
          ],),
           verticalSpace(10),
          const Divider(color: Colors.black,thickness: 0.030,),
          verticalSpace(10),
          Text("Participants", style: grey17Normal,),
           verticalSpace(10),
           Padding(padding: EdgeInsets.all(8),
           child: SizedBox(
             height: 80,
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount:usersOfGroup.length ,
               itemBuilder:(context , index){
                 return Row(children: [Stack(
                           children:[ ClipOval(
                                                child: Image(
                                                 image: AssetImage(usersOfGroup[index].image),
                                                 fit: BoxFit.cover,width: 60,height: 60, ),),
                                                const Positioned(
                                                   bottom: 0,
                                                   left: 30,
                                                   right: 0,
                                                   child: CircleAvatar(
                                                     backgroundColor: ColorManager.mainColor,
                                                     radius: 10,
                                                     child: Icon(Icons.close,color: Colors.black,size: 20,)),
                                                 )
                                             ]),
                                             horizontalSpace(10)
                                             ],);
                 
               } ,
               ),
               
           ),
           )
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(45))), 
        backgroundColor: ColorManager.mainColor,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const GroupChatView()));
        },
        child:const Icon(Icons.arrow_forward , color: Colors.white,),
        ),
    );
  }
}