import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/home/profile.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  bool isClicked = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: <Widget>[
            // Your other widgets here
            Container(
              height: 60,
              // Setting height to double.infinity to make it fill the entire screen
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(31, 65, 65, 65),
                    offset: Offset(0, -2),
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon: Image.asset(
                        "assets/images/${isClicked ? "home_fill" : "home_empty"}.png",
                        height: 35,
                        width: 30,
                        color: Colors.blue,
                      ),
                      onPressed: () => setState(() {
                            isClicked = !isClicked;
                          })),
                  SizedBox(
                    width: 77,
                  ),
                  IconButton(
                      icon: Image.asset(
                        "assets/images/${!isClicked ? "search_fill" : "search_empty"}.png",
                        height: 35,
                        width: 30,
                        color: Colors.blue,
                      ),
                      onPressed: () => setState(() {
                            isClicked = !isClicked;
                          })),
                  SizedBox(
                    width: 77,
                  ),
                  IconButton(
                    // Using ClipOval to clip the image to a circle
                    // Image to come fom firebase
                    icon: ClipOval(
                        child: Image.network(
                      "https://cdn.hswstatic.com/gif/play/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg",
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    )),
                    // TODO : Add the onPressed function to open drawer
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(),
                        ),
                      ),
                    },
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
