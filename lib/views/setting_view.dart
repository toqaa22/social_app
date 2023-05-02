import 'package:flutter/material.dart';
import 'package:socialapp/views/edit_view.dart';
import 'package:socialapp/views/login_view.dart';
import 'package:socialapp/views/nav_bar.dart';
import 'package:socialapp/views/profile_view.dart';

import '../constants.dart';


class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:( BuildContext context)=>  const Navbar(),));
        }, icon: const Icon(Icons.arrow_back,size: 30,),color: kPrimaryColor,),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Setting',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),),
      body: ListView(

        children: <Widget>[
           ListTile(
            title: const Text(
              'My Profile',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            trailing:IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:( BuildContext context)=>  const Profile(),));
            }, icon: const Icon(Icons.keyboard_arrow_right,size: 35,color:  kPrimaryColor,)),
          ),
           Divider(
            color: Colors.grey.shade700,
            height: 3.0,
            indent: 3.0,
          ),
           ListTile(
            title: const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:( BuildContext context)=>  const EditView(),));
            },
                icon: const Icon(Icons.keyboard_arrow_right,size: 35,color:  kPrimaryColor,)),
          ),
           Divider(
            color: Colors.grey.shade700,
            height: 3.0,
            indent: 3.0,
          ),
           ListTile(
            title: const Text(
              'LogOut',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:( BuildContext context)=>  LoginView(),));
            },
                icon: const Icon(Icons.keyboard_arrow_right,size: 35,color: kPrimaryColor,)),
          ),
           Divider(
            color: Colors.grey.shade700,
            height: 3.0,
            indent: 3.0,
          ),

        ],
      ),
    );
  }
}
