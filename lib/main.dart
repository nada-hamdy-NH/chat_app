import 'package:chat_app/core/di/dependency_injection.dart';
import 'package:chat_app/features/splash/presentation/views/splashScreen.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 await setUpGet();
  await ScreenUtil.ensureScreenSize();
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('=================User is currently signed out!=================');
    } else {
      print('=================User is signed in!=================');
    }
  });
    return const ScreenUtilInit(
      designSize: Size( 375,812),
      minTextAdapt: true,
      child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    ));
  }
}

