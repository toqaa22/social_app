import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socialapp/views/models/user_model.dart';
import 'package:socialapp/views/widgets/custom_button.dart';
import 'package:socialapp/views/widgets/custom_text_field.dart';

import '../../constants.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  final picker = ImagePicker();
  void updateBio() {
    FirebaseFirestore.instance.collection('user').doc(user!.id).update({
      'bio': bioController.text.toString(),
    }).then((value) {
      FirebaseFirestore.instance.collection('user').doc(user!.id).get().then((value) {
        user = UserModel.fromJson(value.data());
        emit(ProfileChangeInfo());
      });
    });
  }

  void updateName() {
    FirebaseFirestore.instance.collection('user').doc(user!.id).update({
      'name': nameController.text.toString(),
    }).then((value) {
      FirebaseFirestore.instance.collection('user').doc(user!.id).get().then((value) {
        user = UserModel.fromJson(value.data());
        emit(ProfileChangeInfo());
      });
    });
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.image,
                            size: 60.0,
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                      onTap: () {
                        _imgFromGallery();
                      },
                    )),
                  ],
                )),
          );
        });
  }

  _imgFromGallery() async {
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50).then((value) {
      // ref btd5lny gwa el storage (gwa el 7aga )
      FirebaseStorage.instance.ref().child('Profile Image/${user!.id}').putFile(File(value!.path.toString())).then((value) {
        value.ref.getDownloadURL().then((value) {
          FirebaseFirestore.instance.collection('user').doc(user!.id).update({'profileImage': value}).then((value) {
            FirebaseFirestore.instance.collection('user').doc(user!.id).get().then((value) {
              user = UserModel.fromJson(value.data());

              emit(ProfileImageChangeSuccess());
              // setState(() {
              //
              // });
            });
          });
        });
      });
      // setState(() {
      //   imageFile = value;
      // });
    });
  }

  Future permission({required context}) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    if (statuses[Permission.storage]!.isGranted) {
      showImagePicker(context);
    } else {
      print('no permission provided');
    }
  }

  void showTextEditName(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                      child: Column(
                        children: [
                          CustomTextField(controller: nameController, hintText: 'Name', title: 'Name', icon: Icon(Icons.account_circle)),
                          SizedBox(height: 12.0),
                          CustomButton(
                              ontap: () {
                                updateName();
                                nameController.clear();
                              },
                              name: 'Change Name',
                              color: Colors.black),
                        ],
                      ),
                    )),
                  ],
                )),
          );
        });
  }

  GlobalKey<FormState> cubitformkey = GlobalKey();

  void showTextEditBio(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              margin: const EdgeInsets.only(top: 8.0),
              padding: const EdgeInsets.all(12),
              child: InkWell(
                child: Column(
                  children: [
                    CustomTextField(controller: bioController, hintText: 'Enter Your Bio', title: 'Bio', icon: Icon(Icons.account_circle)),
                    SizedBox(height: 12.0),
                    CustomButton(
                        ontap: () {
                          updateBio();
                          bioController.clear();
                        },
                        name: 'Change Bio',
                        color: Colors.black),
                  ],
                ),
              ));
        });
  }
}
