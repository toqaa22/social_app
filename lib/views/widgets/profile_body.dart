import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,width: 300,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Posts",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "100",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              width: 2,
              color: Colors.grey[600],
              thickness: 3,
              endIndent: 330,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "  Followers",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "  100",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              width: 1,
              color: Colors.grey[600],
              thickness: 2,
              endIndent: 330,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Flexible(
                      child: Text(
                    "Following",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "100",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
