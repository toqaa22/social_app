import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socialapp/views/models/user_model.dart';

import '../../constants.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit({this.image,}) : super(AddPostInitial());

  static AddPostCubit get(context) => BlocProvider.of(context);
  File? image;
  final picker = ImagePicker();

  Future uploadImage() async {
    if (image == null) return;

    FirebaseFirestore.instance.collection('users').doc(user!.id).collection('postsImages');

    }




  Future permission({required context}) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    if (statuses[Permission.storage]!.isGranted) {
      imgFromGallery();
    } else {
      print('no permission provided');
    }
  }



  imgFromGallery() async {
    await picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    ).then((value) {

      FirebaseFirestore.instance.collection('users').doc(user!.id).collection(
          'postImages');
    });
  }
}

