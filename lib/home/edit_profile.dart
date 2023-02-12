import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/home/profile.dart';
import 'package:twitter/validation/validators.dart';
import 'package:twitter/widget/home_nav_bar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Edit Profile",
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.done,
                color: Colors.blue,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              ),
            ),
          ]),
      body: SingleChildScrollView(
          child: Form(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://wallpaperaccess.com/full/1892973.jpg"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Colors.blue,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Container(
                      width: 350,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator:((value) => nameValidator(value!)),
                        initialValue: "Shaun Dsouza",
                        decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.red),
                          ),
                          hintText: 'Name',
                          hintStyle: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                      width: 350,
                      child: TextFormField(
                        validator: (value) => null,
                        initialValue: "Student at VESIT",
                        decoration: InputDecoration(
                          labelText: "Bio",
                          labelStyle: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.blue),
                          ),
                          hintText: 'Enter new bio',
                          hintStyle: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                      width: 350,
                      child: TextFormField(
                        validator: (value) => null,
                        initialValue: "Mumbai,India",
                        decoration: InputDecoration(
                          labelText: "Location",
                          labelStyle: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.blue),
                          ),
                          hintText: 'Enter Location',
                          hintStyle: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                      width: 350,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => emailValidator(value!),
                        initialValue: "",
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.blue),
                          ),
                          hintText: 'Enter Email',
                          hintStyle: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: HomeNavBar(),
    );
  }
}
