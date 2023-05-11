import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hintText, required this.title, required this.icon, this.onChanged, this.controller});
  String hintText;
  String title;
  Icon icon;
  TextEditingController? controller;

  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (data) {
        // if(controller!.text.isEmpty){
        //   return "Must not be Embty";
        // }

        if (data!.isEmpty || controller!.text.isEmpty) {
          return "Must not be Embty";
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: title,
        hintText: hintText,
        prefixIcon: icon,
        border: const OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
