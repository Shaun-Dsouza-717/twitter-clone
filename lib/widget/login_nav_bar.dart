import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginNavBar extends StatefulWidget {
  final bool isEmail;
  final Function toggleEmail;
  const LoginNavBar(
      {required this.isEmail, required this.toggleEmail, super.key});

  @override
  State<LoginNavBar> createState() => _LoginNavBarState();
}

class _LoginNavBarState extends State<LoginNavBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: <Widget>[
            // Your other widgets here
            Container(
              height: 60,
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
                  TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      child: widget.isEmail ? Text('Use email instead',
                          style: GoogleFonts.roboto(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )) : Text('Use phone instead',
                              style: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )) ,
                      onPressed: () {
                        widget.toggleEmail();
                      }),
                  SizedBox(width: 170),
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                      child: Text('Next',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
