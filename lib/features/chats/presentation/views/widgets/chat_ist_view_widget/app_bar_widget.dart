import 'package:chat_app/core/di/dependency_injection.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/views/login_view.dart';
import 'package:chat_app/features/chats/data/models/chat_model.dart';
import 'package:chat_app/features/chats/presentation/view_model/search_cubit.dart';
import 'package:chat_app/features/chats/presentation/view_model/search_states.dart';
import 'package:chat_app/features/groups/presentaion/view/add_group_view.dart';
import 'package:chat_app/features/profile/presentation/views/profile_view.dart';
import 'package:chat_app/features/show_contact/presentation/view_model/show_contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
final List<ChatModel>unSearchChats;
   AppBarWidget( {super.key,required this.unSearchChats });

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
  
  @override
  Size get preferredSize =>const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
 
  @override
  Widget build(BuildContext context) {
     final searchCubit = context.read<SearchCubit>();
     return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.isSearching) {   
      return  AppBar(
backgroundColor: Colors.white,
  title: Container(
    width:450.w, 
    height:50.h ,
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(45),
    ),
    child: TextField(
      onChanged: (value) {
       searchCubit.updateSearchList(value, widget.unSearchChats);
  },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric( horizontal:  10.w , vertical: 10.h),
        hintText: "search...",
       border: InputBorder.none,
      )
    ),
  ) ); 
      }else{
  return  AppBar(
backgroundColor: Colors.white,
  title:Padding(
    padding: EdgeInsets.only(left: 25.w,),
    child: Text("WhatsUp",style: black28W500) ),
  actions: [ 
     IconButton(onPressed: (){
       searchCubit.toggleSearchMode();
     }, icon: const Icon(Icons.search , size: 30,)),
      Builder(
        builder: (context) {
          return IconButton(
                  icon: const Icon(Icons.more_vert_sharp, size: 30),
                  onPressed: () {
                    showMenu(
                      context: context,
                      position: const RelativeRect.fromLTRB(50,85, 0.0, 0.0), 
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

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BlocProvider(create: (context) => getIt<ShowContactCubit>()..showContact(),
                         child: const AddGroupView()
                         )
                         )
                         );
                      }

                    }
                    );
                  },
        );
        },
      
      )
  ], 
bottom: const PreferredSize(preferredSize: Size.fromHeight(25),
 child: Divider(color: Colors.black,thickness: 0.030,)
 )
  

  
);
      }});
      }
    
    
    
    
  }


