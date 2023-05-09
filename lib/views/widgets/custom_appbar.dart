import 'package:flutter/material.dart';
import 'package:socialapp/views/setting_view.dart';

import '../../constants.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(user!.profileImage.toString()),
          radius: 20,
        ),
        // IconButton(onPressed: (){
        // }, icon: const Icon(Icons.person,size: 30,),color: kPrimaryColor,),
        const Spacer(),
        const Text("Feed",style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
       const Spacer(),
        IconButton(onPressed: (){}, icon: const Icon(Icons.chat_rounded,size: 30,),color: kPrimaryColor,),

        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:( BuildContext context)=> const SettingView(),));
        }, icon: const Icon(Icons.menu,size: 30,),color:kPrimaryColor,),

      ],
    );
  }
}
