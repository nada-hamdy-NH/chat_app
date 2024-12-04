import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/shared_widgets/button_widget.dart';
import 'package:chat_app/core/shared_widgets/text_form_field_widget.dart';
import 'package:chat_app/core/themes/colos.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/already_have_an_account.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/register_image_and_text.dart';
import 'package:chat_app/features/chats/presentation/views/chats_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();
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
                key: formKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       const RegisterImageAndText(),
                        verticalSpace(20),
                       TextFormFieldWidget( labelText: "Name",
                       validate:(value){
                         if(value.isEmpty){
                           return("name is empty");
            
                         }
                
            
                       } ,  hintText: "Enter your name", prefixIcon: Icons.person,  controller: nameController,  ),
                        verticalSpace(20),
                       TextFormFieldWidget(labelText: "Email", hintText: "Enter your email", prefixIcon: Icons.email, controller: emailController,
                        validate: (value){
                          if(value.isEmpty){
                            return("email is empty");
                          }
                          },),
                       verticalSpace(20),
                       TextFormFieldWidget(labelText: "Phone", hintText: "Enter your phone", prefixIcon: Icons.phone, controller: phoneController,
                        validate: (value) { 
                            if(value.isEmpty){
                              return("phone is empty");
                            }
                             
                       },),
                       verticalSpace(20),
                       TextFormFieldWidget(labelText: "Password", hintText: "Enter your password",
                       prefixIcon:Icons.lock_outline_sharp,controller: passwordController,
                      isObscureText:isObscureText,
                    suffixIcon:GestureDetector(onTap: (){
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },child:Icon( isObscureText ? Icons.visibility_off : Icons.visibility)),
                     validate: (value){
                      if(value.isEmpty){
                        return ("password is empty");
                      }
                       }
                    ,),
                       verticalSpace(30),
                       ButtonWidget(buttonText: 'Register',
                       buttonTextStyle: black17Bold,
                       buttonBackgroundColor: ColorManager.mainColor,
                        onPressed: () async{
                          if(formKey.currentState!.validate()){
                            bool success = await BlocProvider.of<AuthCubit>(context).registerUser (nameController.text, emailController.text, passwordController.text, phoneController.text);
                            if(success == true){
                               Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const ChatsView()));
                            }
                          
                        
                         }
              
              }),
                       verticalSpace(30),
                       const AlreadyHaveAnAccount(),
                  ]),
                ),
              ),
            
          )
    ));
  }
}