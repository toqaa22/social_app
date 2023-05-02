import 'package:flutter/material.dart';
import 'package:socialapp/views/edit_view.dart';
import 'package:socialapp/views/widgets/custom_button.dart';
import 'package:socialapp/views/widgets/customprofile_appbar.dart';
import 'package:socialapp/views/widgets/profile_avatar.dart';
import 'package:socialapp/views/widgets/profile_body.dart';

import '../constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomProfileAppBar(),
            const SizedBox(
              height: 50,
            ),
            ProfileAvatar(image: "assets/images/profile2.jpg"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Name",
                  style: TextStyle(fontSize: 25),
                ),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:( BuildContext context)=> const EditView(),));
                }, icon: const Icon(Icons.edit,color: kPrimaryColor,)),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Bio",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              width: 400,
              padding: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
             child:IntrinsicHeight(
               child: Column(
                 children: [
                   const ProfileBody(),
                 CustomButton(name: "Add Post", color: Colors.black,),
                   const SizedBox(height: 30,),
                   const Divider(
                     color: Colors.grey,thickness: 2,endIndent: 30,indent: 30,
                   )


                 ],
               ),
             ),

            ),

          ],
        ),
      ),
    ));
  }
}
