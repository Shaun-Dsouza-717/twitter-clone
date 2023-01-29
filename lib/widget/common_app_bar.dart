import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonAppBar extends StatelessWidget {
  final bool isBack;
  final String type;
  const CommonAppBar({required this.isBack, Key? key, this.type = ""})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Checks if the type is empty to show the default appbar else show profile appbar
    return this.type == ""
        ? AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: isBack
                ? IconButton(
                    icon: Image.asset(
                      "assets/images/arrow-left.png",
                      height: 35,
                      width: 30,
                      color: Colors.blue,
                    ),
                    onPressed: () => Navigator.pop(context),
                  )
                : null,
            title: Image(
              image: AssetImage('assets/images/twitter.png'),
              height: 35,
              width: 30,
            ),
            centerTitle: true,
          )
        :
        // Profile appbar
        AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            // Checks if the isBack is true to show the back button else show nothing
            leading: isBack
                ? IconButton(
                    icon: Image.asset(
                      "assets/images/arrow-left.png",
                      height: 25,
                      width: 25,
                      color: Colors.blue,
                    ),
                    onPressed: () => Navigator.pop(context),
                  )
                : null,
            // Name and number of tweets
            title: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 170,
                    child: Text(
                      "Shaun Dsouza",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 168,
                    child: Text(
                      "1.2K Tweets",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Follow button
            // TODO: When viewing my own profile, this should be none
            // TODO: When viewing someone else's profile and i scroll below follow button present it should pop up here as well
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.only(right: 7),
                    child: Container(
                      width: 100,
                      height: 100,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        child: Text('Following',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        onPressed: () {},
                      ),
                    ),
                  ))
            ],
          );
  }
}
