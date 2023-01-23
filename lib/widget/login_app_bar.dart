import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget {
  final bool isBack;
  const LoginAppBar(this.isBack,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading:isBack ?  IconButton(
        icon: Image.asset("assets/images/arrow-left.png", height: 35, width: 30, color: Colors.blue,),
        onPressed: () => Navigator.pop(context),
      ): null,
      title: Image(
        image: AssetImage('assets/images/twitter.png'),
        height: 35,
        width: 30,
      ),
      centerTitle: true,
    );
  }
}
