import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.only(left: 20,top: 15,right: 15),
            width: 400,
            height: 400,

            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              Row(children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person),
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 10,),

                Column(children: const [
                  Text("name"),
                  Text("date"),
                ],),
                const Spacer(),
                IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),

              ],),
              const SizedBox(height: 10,),

              SizedBox(

                height: 220,
                width: 350,
                child: Image.asset("assets/images/pink2.jpg"),
              ),
              SizedBox(height: 10,),
              Text("Caption"),
                SizedBox(height: 10,),


              Row(
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outlined),color:  Colors.black),
                  const SizedBox(width: 2),
                  const Text("245",style:  TextStyle(fontWeight: FontWeight.bold),),
                  const Spacer(),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline),color:  Colors.black),

                  IconButton(onPressed: (){}, icon: const Icon(Icons.mode_comment_rounded),color: Colors.black),

                ],
              ),
            ],),),
        );
      },
    );
  }
}
