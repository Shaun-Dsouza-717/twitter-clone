import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/widget/login_app_bar.dart';
import 'package:twitter/widget/login_nav_bar.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();

}

class _SignupState extends State<Signup> {
  bool isEmail = true;
  
  void toggleEmail() {
    setState(() {
      isEmail = !isEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), 
          child: LoginAppBar()),
      body: Container(
          height: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  Container(
                      color: Colors.white,
                      width: 320,
                      height: 110,
                      alignment: Alignment.center,
                      child: Text(
                        'Create your account',
                        style: GoogleFonts.roboto(
                          color: Colors.blue,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.rtl,
                      )),
                  SizedBox(height: 50),
                  Container(
                      width: double.infinity,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 20.0, color: Colors.black),
                          ),
                          hintText: 'Name',
                          hintStyle: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                  SizedBox(height: 75),
                  isEmail ? TextFormField(
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      hintText: 'Phone',
                      hintStyle: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ): TextFormField(
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      hintText: 'Email',
                      hintStyle: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
      bottomNavigationBar: LoginNavBar(isEmail: isEmail, toggleEmail: toggleEmail),
    );
  }
}
