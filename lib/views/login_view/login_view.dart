import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/views/login_view/login_cubit.dart';
import 'package:socialapp/views/signup_view/signup_view.dart';
import 'package:socialapp/views/widgets/custom_button.dart';
import 'package:socialapp/views/widgets/custom_text_field.dart';
import '../../constants.dart';


class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit, LoginState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      LoginCubit cubit =LoginCubit.get(context);
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
              key: cubit.formkey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    CustomButton(
                        ontap: () async {
                          if (cubit.formkey.currentState!.validate()) {
                           cubit.login(context: context, email: cubit.email.toString(), password: cubit.password.toString());

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
                                  builder: (BuildContext context) => const SignUpView(),
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
    },
  )
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
