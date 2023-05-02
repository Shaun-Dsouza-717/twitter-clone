import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldRef;
  const HomeAppBar({this.scaffoldRef,super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Returning the AppBar
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // Setting the first icon button as the options icon
      leading: IconButton(
          onPressed: () {
            // Opening the drawer
            widget.scaffoldRef!.currentState!.openDrawer();
          },
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
