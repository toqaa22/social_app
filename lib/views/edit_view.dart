import 'package:flutter/material.dart';
import 'package:socialapp/views/profile_view.dart';
import 'package:socialapp/views/widgets/custom_button.dart';
import 'package:socialapp/views/widgets/profile_avatar.dart';

import '../constants.dart';

class EditView extends StatefulWidget {
  const EditView({Key? key}) : super(key: key);

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:  Scaffold(
      appBar: AppBar(
        leading:  IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:( BuildContext context)=> const Profile(),));
        }, icon: const Icon(Icons.arrow_back,size: 30,),color: kPrimaryColor),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Edit',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50,),
           ProfileAvatar(image: "assets/images/profile2.jpg"),
            const SizedBox(height: 20,),
            const Text(
              "Name",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 15,),
            const Text(
              "Bio",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 30,),
           CustomButton(
             name: "Upload Photo",
             color: Colors.black,
           ),
            const SizedBox(height: 15,),
           CustomButton(
               name: "Edit Name",
             color: Colors.black,
           ),
            const SizedBox(height: 15,),
           CustomButton(
               name: "Edit Bio",
             color: Colors.black,
           ),
          ],
        ),
      ),
    ));
  }
}
