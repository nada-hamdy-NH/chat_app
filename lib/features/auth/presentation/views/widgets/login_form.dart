import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  final String labelText ;
  final String hintText;
  final IconData prefixIcon;
  const LoginForm({super.key, required this.labelText, required this.hintText, required this.prefixIcon});
   

  @override
  Widget build(BuildContext context) {
  return Column(children: [
    Container(
      width: 340.w,
      height: 50.h,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(28)),
            borderSide: BorderSide(
              color: Color(0xFFB9BCB3),
              width: 1.0,

      
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
          prefixIcon: Icon(prefixIcon),
      
        ),
      
      ),
    )
  ],);

  }
}