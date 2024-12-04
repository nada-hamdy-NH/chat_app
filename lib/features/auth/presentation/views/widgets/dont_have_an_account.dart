import 'package:chat_app/core/di/dependency_injection.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/views/register_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
        TextSpan(
          text: 'Don’t have an account?',
          style: grey15Normal,
        ),
          TextSpan(
                text: '   Register here',
                style: mainColor17Normal,
                recognizer: TapGestureRecognizer()..onTap = () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BlocProvider(
                    create:(context)=> AuthCubit(getIt()),
                    child: const RegisterView(),
                    )
                  ));
                }
              ),
        ])
  );}
}