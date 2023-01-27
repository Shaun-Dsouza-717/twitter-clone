import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Returning the AppBar
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // Setting the first icon button as the options icon
      leading:     IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/more_options.png",
              height: 23,
              width: 23,
              color: Colors.blue,
            )),
      // Main Logo of Twitter set up in the title
      title: Image(
        image: AssetImage('assets/images/twitter.png'),
        height: 30,
        width: 30,
      ),
      // Actions are the icons on the right side of the app bar which is the customize icon
      actions: [
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/customize.png",
              height: 30,
              width: 30,
              color: Colors.blue,
            )),
      ],
      centerTitle: true,
    );
  }
}
