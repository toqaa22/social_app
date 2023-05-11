import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/views/home_view/home_cubit.dart';
import 'package:socialapp/views/widgets/posts.dart';
import 'package:socialapp/views/widgets/statusbar.dart';

import '../widgets/custom_appbar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..getPost(),
        child: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
          // TODO: implement listener
        }, builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
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
                  Expanded(
                    child:    ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Posts(
                          name: cubit.posts[index].name.toString(),
                          profileImage: cubit.posts[index].profileImage.toString(),
                          caption: cubit.posts[index].caption.toString(),
                          time: cubit.posts[index].time.toString(),
                          imageUrl: cubit.posts[index].imageUrl.toString(),
                        );



                      },
                      itemCount: cubit.posts.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
