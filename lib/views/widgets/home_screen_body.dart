import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/views/widgets/statusbar.dart';

import 'custom_appbar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: const [
            CustomAppBar(),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 100, child: StatusBar()),
            // Expanded(child: Posts()),
          ],
        ),
      ),
    );
  }
}
