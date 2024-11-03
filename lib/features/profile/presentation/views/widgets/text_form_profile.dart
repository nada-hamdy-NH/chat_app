import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextField customTextField({required String hintText,  TextEditingController? controller}) =>TextField(
           controller: controller,
          minLines: null,
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: Colors.white,
              filled: true,
            helperMaxLines: 1,
            contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w),
            border: InputBorder.none,
        ),
        maxLines: null,
      );
