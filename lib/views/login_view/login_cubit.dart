import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/views/models/user_model.dart';


import '../nav_bar.dart';
import '../widgets/show_snack_bar.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  String? uId;
  String? email;
  String? password;
  GlobalKey<FormState> formkey = GlobalKey();
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context)=>BlocProvider.of(context);


  void login({required context,required String email,required String password})async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value)async{
        uId=value.user!.uid;
       await FirebaseFirestore.instance.collection('user').doc(uId).get().then((value) {
         user = UserModel.fromJson(value.data());
         Navigator.push(
             context,
             MaterialPageRoute(
               builder: (BuildContext context) => const Navbar(),
             ));

       });


      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('No user found for that email.'),
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

        // showSnackBar(context, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, "Wrong password provided for that user.");
      }
    } catch (e) {
      print(e);
    }

  }
}
