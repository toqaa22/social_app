import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
   Posts({Key? key,required this.imageUrl,required this.caption,required this.time,required this.name,required this.profileImage}) : super(key: key);
   String time;
   String caption;
   String imageUrl;
   String name;
   String profileImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(left: 20, top: 15, right: 15),
        width: 400,
        height: 400,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Image.network(profileImage),
              ),
              
              Column(
                children:  [
                  Text(name),
                  Text(time),
                ],
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 220,
            width: 350,
            child: Image.network(imageUrl),
          ),
          SizedBox(
            height: 10,
          ),
          Text(caption),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outlined),
                  color: Colors.black),
              const SizedBox(width: 2),
              const Text(
                "245",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                  color: Colors.black),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mode_comment_rounded),
                  color: Colors.black),
            ],
          ),
        ]),
      ),
    );
  }
}
