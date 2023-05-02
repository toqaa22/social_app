import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/views/nav_bar.dart';
import 'package:socialapp/views/signup_view/signup_view.dart';
import 'package:socialapp/views/widgets/custom_button.dart';
import 'package:socialapp/views/widgets/custom_text_field.dart';
import 'package:socialapp/views/widgets/show_snack_bar.dart';

import '../constants.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  String? email;
  String? password;
  GlobalKey<FormState> formkey = GlobalKey();

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
              child: Image.asset(
                "assets/images/pinkleaveees.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Form(
            key: formkey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    hintText: 'Enter Your Email',
                    title: "email",
                    icon: const Icon(Icons.email_outlined),
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    hintText: 'Enter Your Password',
                    title: "Password",
                    icon: const Icon(Icons.lock),
                    onChanged: (data) {
                      password = data;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      ontap: () async {
                        if (formkey.currentState!.validate()) {
                          try {
                            UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              showSnackBar(context, "No user found for that email.");
                            } else if (e.code == 'wrong-password') {
                              showSnackBar(context, "Wrong password provided for that user.");
                            }
                          } catch (e) {
                            print(e);
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Navbar(),
                              ));
                        }
                      },
                      name: "LogIn",
                      color: kPrimaryColor),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't Have Account ?",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => SignUpView(),
                              ));
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
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
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.65, size.width * 1.5, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.85, size.width * 1.5, size.height * 0)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
