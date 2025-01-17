import 'package:chat_app/core/helpers/lists.dart';
import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/data/models/auth_model.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/home_widgets/add_message_button.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/home_widgets/add_message_field.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/home_widgets/chat_view_appBar.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/home_widgets/chat_view_background_image.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatView extends StatefulWidget {
  final UserModel receiverData;
  final UserModel currentUserData;

  const ChatView(
      {super.key,
      required this.receiverData, required this.currentUserData,
      });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  var numberOfMessages = 0;
  var numOfResult;
 
  addedMessage(newMessage) {
    setState(() {
      numberOfMessages = chatMessages.length;
      chatMessages.add(newMessage);
      numberOfMessages += 1;
      numOfResult= numberOfMessages ; 
      print(numberOfMessages);
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final String currentUserId = widget.currentUserData.uid;
    String chatId = currentUserId.compareTo(widget.receiverData.uid) < 0
        ? "$currentUserId-${widget.receiverData.uid}"
        : "${widget.receiverData.uid}-$currentUserId";

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: ColorManager.mainColor,
        systemNavigationBarColor: Colors.white));

    return SafeArea(
        child: Scaffold(
            appBar: ChatViewAppbar(
                userImage: widget.receiverData.image, userName: widget.receiverData.name),
            body: Column(children: [
              Expanded(
                  child: Stack(children: [
                const ChatViewBackgroundImage(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("chats")
                          .doc(chatId)
                          .collection("messages")
                          .orderBy("timestamp", descending: false)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print("StreamBuilder error: ${snapshot.error}");
                          return Center(
                            child: Text("An error occurred: ${snapshot.error}"),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final messageFirestore = snapshot.data!.docs;
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _scrollToBottom();
                        });
                        return ListView.builder(
                            controller: _scrollController,
                            itemCount: messageFirestore.length,
                            itemBuilder: (context, index) {
                              if (messageFirestore.isEmpty) {
                                return const SizedBox();
                              } else {
                                final message = messageFirestore[index];
                                final isSender =
                                    message["senderId"] == currentUserId;
                                return BubbleSpecialOne(
                                  color: isSender
                                      ? const Color(0xffDCF8C6)
                                      : Colors.white,
                                  text: message["message"] ?? "",
                                  textStyle: black18Normal,
                                  isSender: isSender,
                                );
                              }
                            });
                      }),
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
                        AddMessageField(
                          messageController: messageController,
                        ),
                        horizontalSpace(10),
                        CircleAvatar(
                            radius: 25.r,
                            backgroundColor: ColorManager.mainColor,
                            child: AddMessageButton(
                              currentUserData:widget.currentUserData ,
                              chatId: chatId,
                            getNumberOfMessages: ()=> numOfResult.toString(),
                                messageController: messageController,
                                receiverData: widget.receiverData,
                                onMessageAdded: addedMessage,
                                scrollToBottom: _scrollToBottom))
                      ],
                    ),
                  ),
                )
              ]))
            ])));
  }
}
