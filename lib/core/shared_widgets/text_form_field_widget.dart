import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String labelText ;
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final controller = TextEditingController();

 TextFormFieldWidget({super.key, required this.labelText, required this.hintText, required this.prefixIcon, this.suffixIcon, this.isObscureText, required TextEditingController controller});
   

  @override
  Widget build(BuildContext context) {
  return Column(children: [
    Container(
      width: 340.w,
      height: 70.h,
      child: Form(
        child: TextFormField(
          controller: controller,
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
            suffixIcon: suffixIcon
          ),
           obscureText: isObscureText??false,
        
        ),
      ),
    )
  ],);

  }
}