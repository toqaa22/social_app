

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/views/models/user_model.dart';
const kPrimaryColor = Color(0xFFe6bab1);
UserModel? user;
XFile? imageFile;
GlobalKey<FormState> formkey = GlobalKey();