import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return  Container(
                height: 110,
                width: 100,
                child: Stack(
                  children: [
                    Positioned(
                      left: 7,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Positioned(
                        top: 50,
                        child: Text('Your Story'))
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
