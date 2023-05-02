import 'package:flutter/material.dart';
import 'package:socialapp/views/nav_bar.dart';

import '../../constants.dart';


class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading:  IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:( BuildContext context)=>  const Navbar(),));
      }, icon: const Icon(Icons.arrow_back,size: 30,),color: kPrimaryColor,),
      centerTitle: true,
      title: const Text("My Profile",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
    );
  }
}
