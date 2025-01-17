import 'package:chat_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddMessageField extends StatelessWidget {
 final  TextEditingController messageController ; 
  const AddMessageField({super.key , required this.messageController});

  @override
  Widget build(BuildContext context,) {
    return  Expanded(
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
                        );
  }
}