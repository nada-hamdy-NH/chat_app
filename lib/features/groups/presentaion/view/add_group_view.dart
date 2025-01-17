import 'package:chat_app/core/helpers/lists.dart';
import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/groups/presentaion/view/add_group_widget/appBar_add_group.dart';
import 'package:chat_app/features/groups/presentaion/view/group_view.dart';
import 'package:chat_app/features/show_contact/presentation/view_model/show_contact_cubit.dart';
import 'package:chat_app/features/show_contact/presentation/view_model/show_contact_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddGroupView extends StatefulWidget {
  const AddGroupView({super.key});

  @override
  State<AddGroupView> createState() => _AddGroupViewState();
}

int count = 0;
late  final  lengthOfUsers  ; 
 
 
class _AddGroupViewState extends State<AddGroupView> {
   @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }
  Future<void> _fetchInitialData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate delay
    setState(() {
      lengthOfUsers = userData.length; // Capture the initial length
    });
  }

 
  @override
  Widget build(BuildContext context) { 
   
    return Scaffold(
      backgroundColor: Colors.white,
       appBar:appBar,
       body:Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         if( count > 0)
          Column(children: [Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16.0),
           child: Text("$count of $lengthOfUsers selected" , style: black18Normal,),
         ),
         verticalSpace(10),
         Padding(
          padding:const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(children: [
             Expanded(
               child: SizedBox(
                 height: 60,
                 width: double.infinity,
                 child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:usersOfGroup.length,
                    itemBuilder: (context, index) => Row(children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              userData.add(usersOfGroup[index]);
                              count--;
                              usersOfGroup.removeAt(index);
                            });
                          },
                          child: Stack(
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
                        ),
                      horizontalSpace(10)
                    ],)
                      
               ),
             ),
             
         )],),
        ),
        verticalSpace(12),
        const Divider(color: Colors.black,thickness: 0.030,),],
        ),
         
         verticalSpace(7),
         Expanded(
           child: BlocBuilder<ShowContactCubit, ShowContactStates>(
            builder: (context , state){
            if(state is SuccessShowContactState){
            return ListView.builder(
            itemCount: userData.length,
            itemBuilder: (context,index){
             return InkWell(
              onTap: () {
                setState(() {
                   usersOfGroup.add(userData[index]);  
                   count++;
                   userData.removeAt(index);
                });
               
              },
               child: ListTile(
                   leading:ClipOval(
                    child: Image(image: AssetImage(userData[index].image ),fit: BoxFit.cover,width: 60,height: 60, ),),
                    title: Text(userData[index].name),
                    subtitle: Text(userData[index].phoneNumber),
                ),
             );
             });
             }else{
              return const Center(child: CircularProgressIndicator());  
             }
             }
             )
         ),
       
       ]),
       floatingActionButton: FloatingActionButton(onPressed: (){
         if(usersOfGroup.isNotEmpty){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const GroupView()));
         }
       } ,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(45))), 
       
       backgroundColor:usersOfGroup.isNotEmpty ? ColorManager.mainColor : Colors.lightGreen[100],
        child:const Icon(Icons.arrow_forward , color: Colors.white),
        ),
    );
  }
}