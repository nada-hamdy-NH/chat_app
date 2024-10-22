import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/shared_widgets/button_widget.dart';
import 'package:chat_app/core/shared_widgets/text_form_field_widget.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/already_have_an_account.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/register_image_and_text.dart';
import 'package:chat_app/features/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isObscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 const RegisterImageAndText(),
                  verticalSpace(20),
                 TextFormFieldWidget(labelText: "Name", hintText: "Enter your name", prefixIcon: Icons.person, controller: nameController,),
                  verticalSpace(20),
                 TextFormFieldWidget(labelText: "Email", hintText: "Enter your email", prefixIcon: Icons.email, controller: emailController,),
                 verticalSpace(20),
                 TextFormFieldWidget(labelText: "Phone", hintText: "Enter your phone", prefixIcon: Icons.phone, controller: phoneController,),
                 verticalSpace(20),
                 TextFormFieldWidget(labelText: "Password", hintText: "Enter your password",
                 prefixIcon:Icons.lock_outline_sharp,controller: passwordController,
                isObscureText:isObscureText,
              suffixIcon:GestureDetector(onTap: (){
                setState(() {
                  isObscureText = !isObscureText;
                });
              },child:Icon( isObscureText ? Icons.visibility_off : Icons.visibility))
              ,),
                 verticalSpace(30),
                 ButtonWidget(buttonText: 'Register', onPressed: () {
                   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const HomeScreen()));
                 }),
                 verticalSpace(30),
                 const AlreadyHaveAnAccount(),
            ]),
          ),
        ),
      ),
    ));
  }
}