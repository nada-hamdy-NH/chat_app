import 'package:chat_app/core/helpers/lists.dart';
import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/chats/presentation/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatViewAppbar extends StatelessWidget implements PreferredSizeWidget {
  final  String userImage;
  final  String userName;
  const ChatViewAppbar({super.key, required this.userImage , required this.userName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home(unSearchChats: listOfChatModel, )));
              }, icon: const Icon(Icons.arrow_back, size: 30,)),
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: ColorManager.mainColor,
                  systemNavigationBarColor: Colors.white),
              title: Row(
                children: [
                   ClipOval(
                    child: Image(
                      image: AssetImage(userImage),
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  horizontalSpace(10),
                  Text(
                    userName,
                    style: black23Normal,
                  ),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.video_call, size: 25)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.call, size: 25)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_sharp, size: 25)),
              ],
            
    );
  }
  
  @override

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}