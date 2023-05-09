import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/splash/splashview_body.dart';


class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFf2d2dd),
      body:  SplashViewBody(),
    );
  }
}