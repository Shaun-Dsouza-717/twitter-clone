import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget {
  final bool isBack;
  final String type;
  const LoginAppBar({required this.isBack, Key? key, this.type = ""})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
        : AppBar(
          backgroundColor: Colors.white,
            elevation: 0,
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
          title: Column(
            children: [
              Text(
                "Muffadal Vohra",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3),
              Padding(padding: EdgeInsets.only(right: 88),
              child: Text(
                  "0 Tweets",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ),
            ]
          )
        );
  }
}
