import 'package:flutter/material.dart';
import 'package:twitter/auth/login.dart';
import 'package:twitter/auth/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Login()
    );
  }
}