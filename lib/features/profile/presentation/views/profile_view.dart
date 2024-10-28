import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/shared_widgets/button_widget.dart';
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
           verticalSpace(10),
            Padding(padding: const EdgeInsets.only(right:320.0),
             child: Text("Name",style: grey20bold,)
             ),
             verticalSpace(10),
               
              Container(
                  width: 340.w,
                  height:55.h,
                  decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 50,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
                  child: customTextField( hintText: "",)),
                 
            
              verticalSpace(25),
             Padding(padding: const EdgeInsets.only(right:320.0),
             child: Text("Phone",style: grey20bold,)
             ),
             verticalSpace(10),
             Container(
                    width: 340.w,
                    height:55.h,
                   decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 50,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
              
               child: customTextField( hintText: "",)),
                  verticalSpace(65),
              ButtonWidget(buttonText: "Save Profile", onPressed: () {},)
             
        ]),
     
    );
  }
}