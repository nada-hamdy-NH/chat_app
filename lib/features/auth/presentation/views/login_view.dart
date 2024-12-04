import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/shared_widgets/button_widget.dart';
import 'package:chat_app/core/shared_widgets/text_form_field_widget.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_image_and_text.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:chat_app/features/chats/presentation/views/chats_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
   const LoginView({super.key});
    
  @override
  State<LoginView> createState() => _LoginViewState();
}


class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
   bool isObscureText = true;
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        backgroundColor: Colors.white,
             body:SingleChildScrollView(
        child: Center(
            child: Form(
                         key: formKey,
                         child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(80),
                  const LoginImageAndText(),
                  verticalSpace(20),
                  TextFormFieldWidget(labelText: "Email", hintText: "Enter your email", prefixIcon: Icons.email,controller:emailController,
                   validate: (value) { 
                      if(value.isEmpty){
                        return("email is empty");
                      }
                    }, )
                  ,verticalSpace(20),
                   TextFormFieldWidget(labelText: "Password", hintText: "Enter your password",
                   prefixIcon:Icons.lock_outline_sharp,controller: passwordController,
                  isObscureText:isObscureText,
                suffixIcon:GestureDetector(onTap: (){
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },child:Icon( isObscureText ? Icons.visibility_off:Icons.visibility)),
                 validate: (value) { 
                  if(value.isEmpty){
                    return("password is empty");
                  }
                  }
                ,),
                  verticalSpace(30),
                   ButtonWidget(buttonText: 'Login',buttonBackgroundColor:ColorManager.mainColor,buttonTextStyle: black17Bold,
                   onPressed: () async{
                    Login();
                   }
                   ),
                  verticalSpace(30),
                 const DontHaveAnAccount(),
                           
                           
                ],),
                           ),
             ),
          ),
        ),
      );
  }
  Login()async{
 if(formKey.currentState!.validate()){
  bool success = await context.read<AuthCubit>().loginUser(emailController.text , passwordController.text);
  if(success==true){
  Navigator.pushReplacement( context, MaterialPageRoute(builder: (context)=>const ChatsView()));
                      }}
  }
}

