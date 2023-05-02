import 'package:flutter/material.dart';
import 'package:socialapp/views/widgets/home_screen_body.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:const  HomeScreenBody(),
    );
  }
}
