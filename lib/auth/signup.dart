import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/auth/login.dart';
import 'package:twitter/validation/validators.dart';
import 'package:twitter/widget/common_app_bar.dart';
import 'package:twitter/widget/login_nav_bar.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Data Variables
  String _name = '', _email = '', _password = '', _phone = '';
  bool isEmail = true;
  bool _isObscure = true;
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  // Firebase Instances
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp() async {
    if (_name.isEmpty && _email.isEmpty && _password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter email and password'),
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
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: _email, password: _password);
      print(userCredential);

      Navigator.of(context).pop(); // Close the loading modal
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Account Created Successfully'),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: '',
            onPressed: () {},
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('The password provided is too weak'),
            backgroundColor: Colors.blue,
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: '',
              onPressed: () {},
            ),
          ),
        );
        Navigator.of(context).pop(); // Close the loading modal

      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('The account already exists for that email'),
            backgroundColor: Colors.blue,
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: '',
              onPressed: () {},
            ),
          ),
        );
        Navigator.of(context).pop(); // Close the loading modal

      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('An error occurred while creating the account'),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: '',
            onPressed: () {},
          ),
        ),
      );
      Navigator.of(context).pop(); // Close the loading modal
    }
  }

  // Function that toggles between email and password fields
  void toggleEmail() {
    if (isEmail) {
      _emailController.clear();
      setState(() {
        isEmail = false;
      });
    } else {
      _phoneController.clear();
      setState(() {
        isEmail = true;
      });
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
                        onChanged: (value) => _name = value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: ((value) => nameValidator(value!)),
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
                  SizedBox(height: 50),
                  !isEmail
                      ? TextFormField(
                          controller: _phoneController,
                          onChanged: (value) => _phone = value,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: ((value) => phoneValidator(value!)),
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            hintText: 'Phone',
                            hintStyle: GoogleFonts.roboto(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      : TextFormField(
                          controller: _emailController,
                          onChanged: (value) => _email = value,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: ((value) => emailValidator(value!)),
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
                  SizedBox(height: 50),
                  TextFormField(
                    onChanged: (value) => _password = value,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: ((value) => passwordValidator(value!)),
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      hintText: 'Password',
                      hintStyle: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObscure =
                                !_isObscure; // Toggle the boolean variable
                          });
                        },
                        child: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
      bottomNavigationBar: LoginNavBar(
          isEmail: isEmail, toggleEmail: toggleEmail, signUp: signUp),
    );
  }
}
