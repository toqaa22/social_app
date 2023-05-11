import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/views/home_screen/cubit/home_cubit.dart';
import 'package:socialapp/views/widgets/custom_appbar.dart';
import 'package:socialapp/views/widgets/statusbar.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(), //..get()
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomAppBar(),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(height: 100, child: StatusBar()),
                  // Expanded(
                  //     child: ListView.builder(
                  //   itemBuilder: (context, index) => Posts(
                  //     name: cubit.posts[index].name.toString(),
                  //     profileImage: cubit.posts[index].profileImage.toString(),
                  //     caption: cubit.posts[index].caption.toString(),
                  //     date: cubit.posts[index].time.toString(),
                  //     imageUrl: cubit.posts[index].imageUrl.toString(),
                  //   ),
                  //   itemCount: cubit.posts.length,
                  // ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
