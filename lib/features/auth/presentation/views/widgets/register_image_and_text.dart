import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/helpers/spacing.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class RegisterImageAndText extends StatelessWidget {
  const RegisterImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const Image(image: AssetImage(AssetsImages.login_image),height: 250,width: 250,),
          verticalSpace(10),
          Text("Register To New Account",style:black25Bold),
        ]
    );
  }
}