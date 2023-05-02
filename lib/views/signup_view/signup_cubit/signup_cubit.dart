import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login_view.dart';
import '../../widgets/show_snack_bar.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  void registerUser({
    required String email,
    required String password,
    required context,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
    showSnackBar(context, "Email Created Successfuly");
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => LoginView(),
        ));
  }
}
