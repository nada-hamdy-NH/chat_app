import 'package:chat_app/core/di/dependency_injection.dart';
import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/features/auth/data/models/auth_model.dart';
import 'package:chat_app/features/chats/presentation/view_model/add_chats_data_cubit.dart';
import 'package:chat_app/features/chats/presentation/views/chat_view.dart';
import 'package:chat_app/features/show_contact/presentation/view_model/show_contact_cubit.dart';
import 'package:chat_app/features/show_contact/presentation/view_model/show_contact_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ShowContact extends StatelessWidget {
   final UserModel currentUserData;
    const ShowContact({super.key, required this.currentUserData });

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.mainColor,
          title:const ListTile(title:Text("Select contact" ,
           style: TextStyle(fontSize: 18 , 
           color: Colors.white , 
           ),
           
           )
           ,subtitle:Text("number of contacts",style: TextStyle(color: Colors.white),) ,),
         
          actions: [IconButton(
              onPressed: (){}, icon:const Icon(Icons.search , color: Colors.white,)) ,
            IconButton(
          
              onPressed: (){}, icon:const Icon(Icons.more_vert_outlined , color: Colors.white,)) ],
              
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child:  Column(
            children: [
              ListTile(
                leading: 
              CircleAvatar(
                backgroundColor: ColorManager.mainColor,
                radius: 22.r,
                child:const Icon(Icons.group , color: Colors.white,size: 27,),
              )),
              verticalSpace(10),
            
              ListTile(
                leading: 
              CircleAvatar(
                backgroundColor: ColorManager.mainColor,
                radius: 22.r,
                child:const Icon(Icons.person_add , color: Colors.white,size: 27, ),
              )),
      
              verticalSpace(10),
      
              Expanded(
                child: BlocBuilder<ShowContactCubit, ShowContactStates>(
                  builder: (context , state){
                  if(state is SuccessShowContactState){
                   return ListView.builder(
                    itemCount: state.userData.length,
                    itemBuilder: (context , index){
                      return InkWell(
                        onTap:() {
                        final reciverData    = state.userData[index];
                        if(reciverData.name.isNotEmpty){
                           print("==============${reciverData.name}=========");
                        }
                        
                        
                           Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>BlocProvider(create: (context) =>getIt<AddChatsDataCubit>(),
                          child: ChatView(
                                    receiverData: reciverData,
                                    currentUserData: currentUserData,
                                    
                                  ),
                                ),
                              ));
                        } ,
                        child: ListTile(
                          leading: ClipOval(child: Image(image: AssetImage(state.userData[index].image),width: 60, height: 60,fit: BoxFit.cover, ),),
                          title: Text(state.userData[index].name),
                          subtitle:const  Text("welcome to chat app"),
                        ),
                      ) ;
                    });
                  } 
       else {
        return const Center(child: Text('No Data Available')); 
      } 
                  
                },
                  
                    
                    )
                ),
      
          
            ],
          ),
        ) ,
         )
      
    );
  }
}