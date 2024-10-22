import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/views/login_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
        TextSpan(
          text: 'Already have an account?',
          style:grey17Normal,
        ),
          TextSpan(
                text: '   Login here',
                style: mainColor17Normal,
                recognizer: TapGestureRecognizer()..onTap = () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginView()));
                }
              ),
        ])
  );
  }
}