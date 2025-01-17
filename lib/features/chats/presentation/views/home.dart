
import 'package:chat_app/core/di/dependency_injection.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/features/auth/data/models/auth_model.dart';
import 'package:chat_app/features/calls/presentation/views/calls_view.dart';
import 'package:chat_app/features/chats/data/models/chat_model.dart';
import 'package:chat_app/features/chats/presentation/view_model/botton_navigation_bar_cubit.dart';
import 'package:chat_app/features/chats/presentation/view_model/search_cubit.dart';
import 'package:chat_app/features/show_contact/presentation/view/show_contact.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/chat_ist_view_widget/app_bar_widget.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/chat_ist_view_widget/chats_list_view.dart';
import 'package:chat_app/features/show_contact/presentation/view_model/show_contact_cubit.dart';
import 'package:chat_app/features/status/presentation/views/status_view.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 class Home extends StatelessWidget {
 final List<ChatModel> unSearchChats;
 final UserModel? currentUserData;
 
  const Home({super.key, this.currentUserData, required this.unSearchChats,} );
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>BottomNaviationBarCubit(),
      child: BlocBuilder< BottomNaviationBarCubit, int>(
        builder: (context ,currentIndex){
          return BlocProvider(
           create: (_) => SearchCubit(),
            child: Scaffold(
            backgroundColor: Colors.white,
            appBar:AppBarWidget(unSearchChats: unSearchChats),
            body: IndexedStack(
              index: currentIndex,
              children: [
                  ChatsListView(  
                       unSearchChats: unSearchChats,
                        ),
                const StatusView(),
              const  CallsView()
              ],
            ),
    
      bottomNavigationBar: BottomNavigationBar(
  elevation: 0,
  currentIndex:currentIndex,
  selectedItemColor: ColorManager.mainColor ,
  selectedLabelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  backgroundColor: Colors.white,
  onTap: (value) {
    
    context.read<BottomNaviationBarCubit>().changeIndex(value);


  },
  items:const [
     BottomNavigationBarItem(
     icon: Icon(Icons.chat , color: ColorManager.mainColor ,size: 32,),
      label:"Chats",),
    BottomNavigationBarItem(
        icon: Icon( Icons.tips_and_updates , color: ColorManager.mainColor,size: 32, ),
      label:"Status", 
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.call , color: ColorManager.mainColor,size: 32, ),
      label:"Calls", 
    )

  ],
  

),
 floatingActionButton:  currentIndex == 0 ? FloatingActionButton(
        backgroundColor: ColorManager.mainColor,
        onPressed:(){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>BlocProvider(
                create: (context) => getIt<ShowContactCubit>()..showContact(),


                child:  ShowContact( currentUserData: currentUserData!,),
              ),
            ),
          );
        },child: const Icon(Icons.chat , color: Colors.white),) : null,
      ));
        },
      ),
    );
  }
}
