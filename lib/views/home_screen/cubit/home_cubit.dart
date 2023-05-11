import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  // List<PostModel> posts = [];
  // void getPosts() {
  //   FirebaseFirestore.instance.collection('user').get().then((value) {
  //     value.docs.forEach((element) {
  //       element.reference.collection('posts').get().then((value) {
  //         value.docs.forEach((element) {
  //           element.reference.get().then((value) {
  //             posts.add(PostModel.fromJson(value.data()));
  //             emit(GetPosts());
  //           });
  //         });
  //       });
  //     });
  //   });
  // }
}
