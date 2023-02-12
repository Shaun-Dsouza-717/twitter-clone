// Imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/auth/signup.dart';
import 'package:twitter/home/feed.dart';
import 'package:twitter/validation/validators.dart';
import 'package:twitter/widget/common_app_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Data variables
  String _email = "", _password = "";
  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _validateAndSubmit(context) async {
    try {
      // Calling the Firebase Auth signInWithEmailAndPassword method to sign in the user
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      CircularProgressIndicator();
      // If the user is signed in successfully, then the user is navigated to the Feed page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Feed()),
      );
    } catch (e) {
      // If the user is not signed in successfully, then a SnackBar is shown with the error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Incorrect Email or Password'),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: '',
            onPressed: () {},
          ),
        ),
      );
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Returns the Main Login page with main buttons and form
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
                          //  Storing the value typed in the email field in the _email variable
                          onChanged: (value) => _email = value,
                          //  Automatically calls the validator method when the user interacts with the field
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // Calls the validation function imported form the validators.dart file 
                          validator: ((value) => emailValidator(value!)),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.blue),
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
                              _validateAndSubmit(context);
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
                                      // Navigates to the Signup page
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
