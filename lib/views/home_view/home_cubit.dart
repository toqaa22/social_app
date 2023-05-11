import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:socialapp/views/models/addpost_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);
List<Postmodel>posts =[];
  void getPost(){

    FirebaseFirestore.instance.collection('user').get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection('posts').get().then((value){
          value.docs.forEach((element) {
            element.reference.get().then((value){
              posts.add(Postmodel.fromJson(value.data()));
              emit(GetPosts());

            });
          });
        });
      });
    });
  }
}
