import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/validation/validators.dart';
import 'package:twitter/widget/common_app_bar.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // Data Variables
  String _email = '';

  // Firebase Instances
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Reset Password Function
  Future resetPassword() async {
    if (_email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter email'),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: '',
            onPressed: () {},
          ),
        ),
      );
      return;
    }

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
      await _auth.sendPasswordResetEmail(email: _email);
      Navigator.of(context).pop(); // Close the loading modal
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Email Verification Link Sent Successfully'),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: '',
            onPressed: () {},
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.of(context).pop(); // Close the loading modal
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('No user found for that email.'),
            backgroundColor: Colors.blue,
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: '',
              onPressed: () {},
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CommonAppBar(isBack: true)),
      body: Container(
          height: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 90,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '?Forgot Password',
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.rtl,
                      )),
                  Positioned(
                    top: 20,
                    child: Text(
                      "Enter your email address below to receive instructions to reset your password. Once you submit your email, check your inbox and follow the steps to complete the process.",
                      style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
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
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: 'Enter Email',
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
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          child: Text('Continue',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          onPressed: () {
                            resetPassword();
                          })),
                ],
              ),
            ),
          )),
    );
  }
}
