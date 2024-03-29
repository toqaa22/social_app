import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/views/login_view/login_view.dart';
import 'package:socialapp/views/signup_view/signup_cubit/signup_cubit.dart';
import 'package:socialapp/views/widgets/custom_button.dart';
import 'package:socialapp/views/widgets/custom_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          SignupCubit cubit = SignupCubit.get(context);
          return Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Image.asset(
                      "assets/images/pinkleaveees.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Form(
                  key: cubit.formKey,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          onChanged: (data){
                            cubit.name=data;
                          },
                          hintText: 'Enter Your Name',
                          title: "Name",
                          icon: const Icon(Icons.person),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                          hintText: 'Enter Your Email',
                          title: "email",
                          icon: const Icon(Icons.email_outlined),
                          onChanged: (data) {
                            cubit.email = data;
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
                            cubit.password = data;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                          onChanged: (data){
                            cubit.phoneNo=data;
                          },
                          hintText: 'Enter Your Number',
                          title: "Number",
                          icon: const Icon(Icons.numbers),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                            ontap: () async {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.registerUser(
                                  email: cubit.email.toString(),
                                  password: cubit.password.toString(),
                                  context: context,
                                );
                              }
                            },
                            name: 'SignUp',
                            color: kPrimaryColor),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already Have Account ?",
                              style: TextStyle(color: Color(0xFFe6bab1)),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => const LoginView(),
                                    ));
                              },
                              child: const Text(
                                "LOGIN",
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
        },
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
