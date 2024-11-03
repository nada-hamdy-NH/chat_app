import 'package:chat_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final Color buttonBackgroundColor;
  final TextStyle buttonTextStyle;
  final IconData? icon;
  const ButtonWidget({super.key, required this.buttonText, this.onPressed, required this.buttonBackgroundColor, required this.buttonTextStyle, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBackgroundColor ,
      ),
       child:Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,size: 20.sp,color: Colors.white,),
          horizontalSpace(10),
          Text(buttonText,style:buttonTextStyle),
        ],
       ) ));
  }
}