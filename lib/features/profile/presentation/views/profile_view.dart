import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/shared_widgets/button_widget.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/text_form_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profile",style: black28W500,),
      bottom: const PreferredSize(preferredSize: Size.fromHeight(25),child:
       Divider(color: Colors.grey,thickness: 1,), ),),
      body: Column(
        children: [
          const ProfileImage(),
           const Divider(color: Colors.grey,thickness: 1,
          ),
           verticalSpace(45),
            Padding(padding: const EdgeInsets.only(right:320.0),
             child: Text("Name",style: grey20bold,)
             ),
             verticalSpace(10),
               
              Container(
                  width: 340.w,
                  height:55.h,            
                  decoration:  BoxDecoration(
                    color:Colors.white , 
                    borderRadius: BorderRadius.circular(35),        
              border: Border.all(color: Colors.grey),
            ),


                  child: Material(
                    color: Colors.white,
                    elevation: 30,
                    shadowColor:Colors.grey,
                     borderRadius: BorderRadius.circular(35),
                      clipBehavior: Clip.antiAlias,
                    child: customTextField( hintText: "",))),
                 
            
              verticalSpace(35),
             Padding(padding: const EdgeInsets.only(right:320.0),
             child: Text("Phone",style: grey20bold,)
             ),
             verticalSpace(10),
              Container(
                  width: 340.w,
                  height:55.h,            
                  decoration:  BoxDecoration(
                    color:Colors.white , 
                    borderRadius: BorderRadius.circular(35),        
              border: Border.all(color: Colors.grey),
            ),


                  child: Material(
                    color: Colors.white,
                    elevation: 30,
                    shadowColor:Colors.grey,
                     borderRadius: BorderRadius.circular(35),
                      clipBehavior: Clip.antiAlias,
                    child: customTextField( hintText: "",))),
                 
                  verticalSpace(75),
              ButtonWidget(buttonText: "Save Profile",
               buttonBackgroundColor:ColorManager.mainColor,
                buttonTextStyle: white17Bold,
                icon: Icons.save ,
              onPressed: () {},)
             
        ]),
     
    );
  }
}