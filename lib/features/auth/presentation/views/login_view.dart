import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/shared_widgets/button_widget.dart';
import 'package:chat_app/core/shared_widgets/text_form_field_widget.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_image_and_text.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:chat_app/features/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
   const LoginView({super.key});
    
  @override
  State<LoginView> createState() => _LoginViewState();
}


class _LoginViewState extends State<LoginView> {
  GlobalKey formKey = GlobalKey() ; 
   bool isObscureText = true;
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        backgroundColor: Colors.white,
             body:SingleChildScrollView(
        child: Center(
            child:
             Form(
          key: formKey,
          child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(80),
                const LoginImageAndText(),
                verticalSpace(20),
                TextFormFieldWidget(labelText: "Email", hintText: "Enter your email", prefixIcon: Icons.email,controller:emailController )
                ,verticalSpace(20),
                 TextFormFieldWidget(labelText: "Password", hintText: "Enter your password",
                 prefixIcon:Icons.lock_outline_sharp,controller: passwordController,
                isObscureText:isObscureText,
              suffixIcon:GestureDetector(onTap: (){
                setState(() {
                  isObscureText = !isObscureText;
                });
              },child:Icon( isObscureText ? Icons.visibility_off:Icons.visibility))
              ,),
                verticalSpace(30),
                 ButtonWidget(buttonText: 'Login',onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const HomeScreen()));
                },),
                verticalSpace(30),
               const DontHaveAnAccount(),
            
            
              ],),
            ),
          ),
        ),
      ),
    );
  }
}