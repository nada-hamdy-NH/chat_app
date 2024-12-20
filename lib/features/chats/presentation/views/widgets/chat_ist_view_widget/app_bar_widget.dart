

import 'package:chat_app/core/di/dependency_injection.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/views/login_view.dart';
import 'package:chat_app/features/groups/presentaion/view/add_group_view.dart';
import 'package:chat_app/features/profile/presentation/views/profile_view.dart';
import 'package:chat_app/features/show_contact/presentation/view_model/show_contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

appBarWidget() => AppBar(
  

backgroundColor: Colors.white,
  title: Padding(
    padding: EdgeInsets.only(left: 25.w,),
    child: Text("WhatsUp",style: black28W500) ),
  actions: [
     IconButton(onPressed: (){}, icon: const Icon(Icons.search , size: 30,)),
      Builder(
        builder: (context) {
          return IconButton(
                  icon: const Icon(Icons.more_vert_sharp, size: 30),
                  onPressed: () {
                    showMenu(
                      context: context,
                      position: const RelativeRect.fromLTRB(50,85, 0.0, 0.0), // Custom position
                      color: Colors.white,
                      constraints: const BoxConstraints(maxWidth: 200 ,minWidth: 200),
                      items: [const
                          PopupMenuItem<String>(
                          value: "New Group",
                          child:Text("New Group")),
                        const PopupMenuItem<String>(
                          value: "Profile",
                          child: Text("Profile"),
                        ),
                        const PopupMenuItem<String>(
                          value: "Log Out",
                          child: Text("Log Out"),
                        ),
                      ],
                    ).then((value) {
                      if (value == "Profile") {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileView()));
                      } else if (value == "Log Out") {
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const LoginView()));
                      }else{

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BlocProvider(create: (context) => getIt1<ShowContactCubit>()..showContact(),
                         child: const AddGroupView()
                         )
                         )
                         );
                      }

                    });
                  },
        );
        },
      
      )],
bottom: const PreferredSize(preferredSize: Size.fromHeight(25),
 child: Divider(color: Colors.black,thickness: 0.030,)
 )
  

  
);



