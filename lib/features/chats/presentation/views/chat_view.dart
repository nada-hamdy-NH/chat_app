import 'package:chat_app/core/helpers/lists.dart';
import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/helpers/strings.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/chat_view_widget/add_message_button.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/chat_view_widget/add_message_field.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/chat_view_widget/chat_view_appBar.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/chat_view_widget/chat_view_background_image.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatView extends StatefulWidget {
  final String userName;
  final String userImage;

  final String receiverId;

  const ChatView(
      {super.key,
      required this.receiverId,
      required this.userName,
      required this.userImage});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  addedMessage(newMessage) {
    setState(() {
      chatMessages.add(newMessage);
    });
  }
    void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    String chatId = currentUserId.compareTo(widget.receiverId) < 0
        ? "${currentUserId}_${widget.receiverId}"
        : "${widget.receiverId}_$currentUserId";

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: ColorManager.mainColor,
        systemNavigationBarColor: Colors.white));

      

    return SafeArea(
        child: Scaffold(
            appBar: ChatViewAppbar(
                userImage: widget.userImage, userName: widget.userName),
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

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text(
                              "No messages yet.",
                              style: TextStyle(color: Colors.grey),
                            ),
                          );
                        }
                        final messageFirestore = snapshot.data!.docs;
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                    _scrollToBottom();
                  });
                        return ListView.builder(
                          controller: _scrollController,
                          reverse: true,
                            itemCount: messageFirestore.length,
                            itemBuilder: (context, index) {
                              if (messageFirestore.isEmpty) {
                                return const SizedBox();
                              } else {
                                 final message = messageFirestore[index];
                               final isSender = message["senderId"] == currentUserId;
                                return BubbleSpecialOne(
                                  color: isSender
                                      ? const Color(0xffDCF8C6)
                                      : Colors.white,
                                  text: message["message"] ?? "",
                                  textStyle: black18Normal,
                                  isSender: isSender , 
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
                              messageController: messageController,
                              receiverId: widget.receiverId,
                              onMessageAdded: addedMessage,
                              scrollToBottom:_scrollToBottom
                            ))
                      ],
                    ),
                  ),
                )

              ]))
            ])));
  }
}
