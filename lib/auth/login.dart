import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/auth/signup.dart';
import 'package:twitter/home/feed.dart';
import 'package:twitter/widget/common_app_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _email = "", _password = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _validateAndSubmit() async {
      try {
        UserCredential user = await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Feed()),
        );
      } catch (e) {
        print('Error: $e');
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CommonAppBar(isBack: false)),
        body: Container(
            height: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: 110,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sign in to Twitter',
                          style: GoogleFonts.roboto(
                            color: Colors.blue,
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.rtl,
                        )),
                    SizedBox(height: 10),
                    Container(
                        width: double.infinity,
                        child: TextFormField(
                          onChanged: (value) => _email = value,
                          validator: (value) => null,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.red),
                            ),
                            hintText: 'Phone,Email or Username',
                            hintStyle: GoogleFonts.roboto(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )),
                    SizedBox(height: 35),
                    Container(
                        width: double.infinity,
                        child: TextFormField(
                          onChanged: (value) => _password = value,
                          validator: (value) => null,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.red),
                            ),
                            hintText: 'Password',
                            hintStyle: GoogleFonts.roboto(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )),
                    SizedBox(height: 35),
                    Container(
                        width: double.infinity,
                        height: 42,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                            child: Text('Next',
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Feed()),
                              // );
                              _validateAndSubmit();
                            })),
                    SizedBox(height: 25),
                    Container(
                        width: double.infinity,
                        height: 42,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.grey)))),
                            child: Text('Forgot password?',
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            onPressed: () {})),
                    SizedBox(height: 25),
                    Container(
                        width: double.infinity,
                        height: 62,
                        child: Row(
                          children: [
                            Text(
                              "Don't have an account?",
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 0),
                            TextButton(
                                child: Text('Sign up',
                                    style: GoogleFonts.roboto(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Signup(),
                                    ),
                                  );
                                }),
                          ],
                        )),
                  ],
                ),
              ),
            )));
  }
}
