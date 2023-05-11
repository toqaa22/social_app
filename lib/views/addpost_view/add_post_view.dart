import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/views/addpost_view/add_post_cubit.dart';
import 'package:socialapp/views/widgets/custom_button.dart';
import 'package:socialapp/views/widgets/custom_text_field.dart';

import '../widgets/show_snack_bar.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AddPostCubit(),
          child: BlocConsumer<AddPostCubit, AddPostState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              AddPostCubit cubit = AddPostCubit.get(context);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        controller: cubit.captionController,
                          hintText: 'Write Something here',
                          title: " Caption",
                          icon: Icon(Icons.closed_caption)),
                      SizedBox(height: 20,),
                      Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],

                        ),
                        child: Center(
                          child: cubit.imageUrl==null ? IconButton(onPressed: () {
                            cubit.permission(context: context);
                          }, icon: Icon(Icons.add),)
                              :Image.network(cubit.imageUrl!.toString())
                          ,
                        ),
                      ),
                      SizedBox(height: 20,),
                      CustomButton(name: 'Post', color: Colors.black,ontap: (){
                        if (cubit.imageUrl!=null) {
                          cubit.addpost(imageUrl: cubit.imageUrl.toString(),
                              time:DateTime.now().toString(),
                              caption: cubit.captionController!.text
                          );
                        }else{
                          showSnackBar(context ,'Please insert Image');
                        }
                      },),

                    ],
                  ),
                ),
              );
            }
          )


      ),

    );
  }
}
