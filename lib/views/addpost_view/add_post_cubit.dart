import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socialapp/views/models/addpost_model.dart';
import 'package:socialapp/views/models/user_model.dart';

import '../../constants.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit({this.image,this.post,this.captionController}) : super(AddPostInitial());

  static AddPostCubit get(context) => BlocProvider.of(context);
  File? image;
  final picker = ImagePicker();
  Postmodel? post;
  TextEditingController? captionController;

 void addpost(
  {
    required String imageUrl,required String time,required String caption
}

     ){
   //add collection posts to docs in collection users
   post=Postmodel(
       imageUrl: imageUrl,
       caption: caption,
       time: time,
     name: user!.name,
     profileImage: user!.profileImage,

   );
   FirebaseFirestore.instance.collection('user').doc(user!.id).collection('posts').add(post!.toMap()).then((value){

   });

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


String? imageUrl;
  imgFromGallery() async {
    await picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    ).then((value) {

     FirebaseStorage.instance.ref().child('user/${user!.id}/${DateTime.now()}').putFile(File(value!.path)).then((value) {
       value.ref.getDownloadURL().then((value) {
         imageUrl=value;
         emit(UploadPhoto());
       });
     });
    });
  }
}

