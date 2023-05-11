import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/views/profile_view/profile_cubit.dart';
import 'package:socialapp/views/profile_view/profile_view.dart';
import 'package:socialapp/views/widgets/custom_button.dart';
import 'package:socialapp/views/widgets/profile_avatar.dart';

import '../constants.dart';

class EditView extends StatelessWidget {
  const EditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const Profile(),
                    ));
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
              color: kPrimaryColor),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Edit',
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocProvider(
            create: (context) => ProfileCubit(),
            child: BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
              // TODO: implement listener
            }, builder: (context, state) {
              ProfileCubit cubit = ProfileCubit.get(context);
              return SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        user!.profileImage!.isEmpty
                            ? ProfileAvatar(image: "assets/images/profile2.jpg")
                            : CircleAvatar(
                                backgroundImage: NetworkImage(user!.profileImage.toString()),
                                radius: 100,
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          user!.name.toString(),
                          style: TextStyle(fontSize: 25),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          user!.bio.toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          ontap: () async {
                            cubit.permission(context: context);
                          },
                          name: "Upload Photo",
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                          ontap: () {
                            cubit.showTextEditName(context);
                          },
                          name: "Edit Name",
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                          ontap: () {
                            cubit.showTextEditBio(context);
                          },
                          name: "Edit Bio",
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
