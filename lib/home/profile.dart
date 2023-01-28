import 'package:flutter/material.dart';
import 'package:twitter/widget/login_app_bar.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child:LoginAppBar(isBack:true,type:"profile"), preferredSize: Size.fromHeight(kToolbarHeight)),
    );
  }
}