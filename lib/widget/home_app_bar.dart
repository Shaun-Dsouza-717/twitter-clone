import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Returning the AppBar
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // Setting the first icon button as the profile icon
      leading: IconButton(
        // Using ClipOval to clip the image to a circle
        icon: ClipOval(
            child: Image.network("https://cdn.hswstatic.com/gif/play/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg",
                height: 30, width: 30,fit: BoxFit.cover,)),
                // TODO : Add the onPressed function to open drawer
        onPressed: () => Navigator.pop(context),
      ),
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
