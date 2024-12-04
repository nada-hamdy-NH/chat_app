import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/helpers/lists.dart';
import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/chats/data/models/chat_model.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
   
   String myName = "chat1" ; 
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: ColorManager.mainColor,
        systemNavigationBarColor: Colors.white));

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: ColorManager.mainColor,
                  systemNavigationBarColor: Colors.white),
              title: Row(
                children: [
                  const ClipOval(
                    child: Image(
                      image: AssetImage(AssetsImages.iron),
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  horizontalSpace(10),
                  Text(
                    "Chat",
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
            ),
            body: Column(children: [
              Expanded(
                  child: Stack(children: [
                const Positioned.fill(
                  child: Image(
                    image: AssetImage(AssetsImages.whatsAppBackground),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: ListView.builder(
                      itemCount: chatMessages.length,
                      itemBuilder: (context, index) {
                        if(chatMessages.isEmpty){
                          return  const SizedBox() ; 
                        }else{
                          final message = chatMessages[index].message;
                        return  BubbleSpecialOne(
                          color: Colors.white,
                          text: message.toString(),
                          textStyle: black23Normal,
                          isSender: chatMessages[index].senderName ==myName ? true :false,
                        );
                      }}),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            height: 50.h,
                            decoration:  BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25.0)),
                              border:  Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade400, width: 1)),
                            ),
                            child: TextFormField(
                              controller: messageController,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon:const Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: Colors.grey,size: 30,
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.attach_file,
                                        color: Colors.grey,
                                        size: 30,
                                      ),
                                      horizontalSpace(10),
                                      const Icon(Icons.camera_alt, color: Colors.grey,size: 30,),
                                    ],
                                  ),
                                ),
                                hintText: "Message",
                                hintStyle:  const TextStyle(color: Colors.grey , fontSize: 20 , fontWeight: FontWeight.w500),
                                contentPadding:  const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                              ),
                            ),
                          ),
                        ),
                        horizontalSpace(10),
                        CircleAvatar(
                          radius: 25.r,
                          backgroundColor: ColorManager.mainColor,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                               if (messageController.text.isNotEmpty) {
                                  chatMessages.add(ChatModel(senderName: myName, message: messageController.text));
                                   
                                        messageController.clear(); // Clear the input field after sending the message
                                }
                              
                              });
                            },
                            icon: const Icon(Icons.send, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]))
            ])));
  }
}
