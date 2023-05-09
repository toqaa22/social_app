import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/views/models/user_model.dart';


import '../../login_view/login_view.dart';
import '../../widgets/show_snack_bar.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);
  String? name;
  String? phoneNo;
  String? email;
  String? password;
  UserModel? user;

  GlobalKey<FormState> formKey = GlobalKey();

  void registerUser({
    required String email,
    required String password,
    required context,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password).then((value)async {
        user = UserModel(name, value.user!.uid, phoneNo,'','',null);
        await FirebaseFirestore.instance.collection('user').doc(value.user!.uid).set(
          user!.toMap(),
        ).then((value) {
          showSnackBar(context, "Email Created Successfuly");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const LoginView(),
              ));

        });
      }
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('The account already exists for that email.'),
              actions: [
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        // showSnackBar(context, "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }

  }
}
