import 'package:flutter/material.dart';

class ClipPath extends StatelessWidget {
  const ClipPath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // return   Scaffold(
    //   body: ClipPath(
    //     clipper: MyClipper(),
    //     child: Container(
    //       width: double.infinity,
    //       height: 50,
    //       child: Image.asset("assets/images/pinkleaveees.jpg",fit: BoxFit.fill,),
    //     ),
    //   ),
    //
    // );
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
