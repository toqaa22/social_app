import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/post_model.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit({
    this.image,
  }) : super(AddPostInitial());

  static AddPostCubit get(context) => BlocProvider.of(context);
  File? image;
  TextEditingController captionController = TextEditingController();
  ImagePicker picker = ImagePicker();
  PostModel? post;

  // void addPost({
  //   required String imageUrl,
  //   required String time,
  //   required String caption,
  // }) {
  //   post = PostModel(
  //     imageUrl: imageUrl,
  //     time: time,
  //     caption: caption,
  //     name: user!.name,
  //     profileImage: user!.profileImage,
  //   );
  //   FirebaseFirestore.instance.collection('user').doc(user!.id).collection('posts').add(post!.toMap());
  // }

  Future uploadImage() async {
    if (image == null) return;

    // FirebaseFirestore.instance.collection('users').doc(user!.id).collection('postsImages');
  }

  Future permission({required context}) async {
    imgFromGallery();
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    if (statuses[Permission.storage]!.isGranted) {
    } else {
      print('no permission provided');
    }
  }

  String? imageUrl;
  imgFromGallery() async {
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50).then((value) {
      // FirebaseStorage.instance.ref().child('user/${user!.id}/${DateTime.now().toString()}').putFile(File(value!.path)).then((value) {
      //   value.ref.getDownloadURL().then((value) {
      //     imageUrl = value;
      //     emit(UploadPhoto());
      //   });
      // });
    });
  }
}
