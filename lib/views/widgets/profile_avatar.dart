import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
   ProfileAvatar({super.key, required this.image}) ;
  String? image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 102,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage('$image'),
      ),
    );
  }
}
