import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextField customTextField({required String hintText,  TextEditingController? controller}) =>TextField(
           controller: controller,
           expands: true,
           minLines: null,
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: Colors.white,
            helperMaxLines: 1,
              hintStyle: TextStyle(height: double.minPositive),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                borderSide: BorderSide(
                  color: Color(0xFFB9BCB3),
                  width: 2.0,
                  
                  ),
                  ),
                focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF4CB050)
                )
              ),
              errorBorder: const OutlineInputBorder(
                 borderSide: BorderSide(
                  color: Colors.red,
          
                  ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  ),
              ),
               contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w),
             border: InputBorder.none,
          
              
             
        ),
        maxLines: null,
      );
