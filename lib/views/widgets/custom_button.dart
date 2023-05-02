import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  CustomButton({this.ontap,required this.name,required this.color}) ;
  VoidCallback? ontap;
  Color color ;

String ?name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 200,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: color,
            width: 2,
          ),
        ),

        child: Center(child: Text('$name')),
      ),
    );
  }
}