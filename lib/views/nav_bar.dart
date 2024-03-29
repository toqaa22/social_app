import 'package:flutter/material.dart';
import 'package:socialapp/views/addpost_view/add_post_view.dart';
import 'package:socialapp/views/home_screen_view.dart';
import 'package:socialapp/views/setting_view.dart';

import '../constants.dart';


class Navbar extends StatefulWidget{
  const Navbar({super.key});

  @override
  State<Navbar> createState()=> NavbarState();


}
class NavbarState extends State<Navbar>{
  static var currentIndex =0;
  List<Widget> screens=[
    const HomeScreenView(),
    const AddPostView(),
    const SettingView(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor:  kPrimaryColor,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: kPrimaryColor,), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.add,color: kPrimaryColor,), label: 'Add Post'),
          BottomNavigationBarItem(icon: Icon(Icons.settings,color: kPrimaryColor,), label: 'Setting'),

        ],
      ),

    );

  }

}