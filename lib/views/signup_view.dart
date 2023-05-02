import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/views/login_view.dart';
import 'package:socialapp/views/widgets/custom_button.dart';
import 'package:socialapp/views/widgets/custom_text_field.dart';
import 'package:socialapp/views/widgets/show_snack_bar.dart';

class SignUpView extends StatelessWidget {
   SignUpView({Key? key}) : super(key: key);
  String? email;
  String? password;
  GlobalKey<FormState>formkey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              width: double.infinity,
              height: 50,
              child: Image.asset("assets/images/pinkleaveees.jpg",fit: BoxFit.fill,),
            ),
          ),
          Positioned(
            left: 15,
            top: 200,
            width: 350,
            child: Form(
              key: formkey,
              child: Column(

                children: [
                  CustomTextField(
                    hintText: 'Enter Your Name',
                    title: "Name",
                    icon: Icon(Icons.person),

                  ),
                  const SizedBox(height: 30,),
                  CustomTextField(
                     hintText: 'Enter Your Email',
                     title: "email",
                     icon: Icon(Icons.email_outlined),
                   onChanged: (data){
                       email=data;
                   },
                  ),
                  const SizedBox(height: 30,),
                  CustomTextField(
                      hintText: 'Enter Your Password',
                      title: "Password",
                      icon: Icon(Icons.lock),
                    onChanged: (data){
                      password=data;
                    },
                  ),
                  const SizedBox(height: 30,),
                  CustomTextField(
                    hintText: 'Enter Your Number',
                    title: "Number",
                    icon: Icon(Icons.numbers),

                  ),

                  const SizedBox(height: 30,),


                 CustomButton(
                     ontap: ()async{
                       if (formkey.currentState!.validate()) {
                         try {
                           UserCredential user =
                           await FirebaseAuth.instance.createUserWithEmailAndPassword(
                               email: email!,
                               password: password!
                           );

                         }on FirebaseAuthException catch (e) {
                           if (e.code == 'weak-password') {
                             showSnackBar(context, "The password provided is too weak.");

                           } else if (e.code == 'email-already-in-use') {
                             showSnackBar(context, "The account already exists for that email.");
                           }
                         } catch (e) {
                           print(e);
                         }
                         showSnackBar(context, "Email Created Successfuly");
                         Navigator.push(context, MaterialPageRoute(builder:( BuildContext context)=>  LoginView(),));
                       }


                     },
                     name: 'SignUp', color: kPrimaryColor),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Aready Have Account ?",style: TextStyle(color: Color(0xFFe6bab1)),),
                      const SizedBox(width: 3,),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder:( BuildContext context)=>  LoginView(),));
                      }, child:const  Text("LOGIN",style:  TextStyle(color: Colors.grey),),),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.4, size.height * 0)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.65,
          size.width * 1.5, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.85,
          size.width * 1.5, size.height * 0)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
