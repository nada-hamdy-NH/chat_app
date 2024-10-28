import 'package:chat_app/features/status/presentation/views/widgets/recent_updates.dart';
import 'package:flutter/material.dart';

class CallsView extends StatelessWidget {
  const CallsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:EdgeInsets.only(left: 20,right: 20,top: 5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            RecentUpdates(circleAvatarColor: Colors.grey,),
          ]))
      
    );
  }
}