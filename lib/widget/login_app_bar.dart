import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Image(
        image: AssetImage('assets/images/twitter.png'),
        height: 35,
        width: 30,
      ),
      centerTitle: true,
    );
  }
}
