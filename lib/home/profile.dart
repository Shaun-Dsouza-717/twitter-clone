import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/home/edit_profile.dart';
import 'package:twitter/widget/common_app_bar.dart';
import 'package:twitter/widget/tweet_builder.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  

  @override
  void initState() {
    super.initState();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    // Profie Screen
    return Scaffold(
        // App Bar for profile which contains name and no. of tweets
        appBar: PreferredSize(
            child: CommonAppBar(isBack: true, type: "profile"),
            preferredSize: Size.fromHeight(kToolbarHeight)),
        // scroll view body to contain profile details
        body: SingleChildScrollView(
            child: Column(
          children: [
            // Stack to contain profile banner and profile image
            Stack(
              // Clip.none to show the profile image over the banner
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  child: Image(
                      image: AssetImage("assets/images/profile-banner.jpg"),
                      fit: BoxFit.cover),
                ),
                // Positioned to show the profile image on top of the banner
                Positioned(
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.white),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                          child: Image.network(
                        "https://wallpaperaccess.com/full/1892973.jpg",
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ))),
                  bottom: -50,
                  left: 20,
                )
              ],
            ),
            SizedBox(height: 1),
            Align(
              alignment: Alignment(0.95, 0),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  width: 118,
                  height: 42,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ))),
                    child: Text('Edit Profile',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(),
                        ),
                        );
                    },
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          left: 20,
                          child: Column(
                            children: [
                              // Name and username
                              Container(
                                width: 280,
                                child: Text('Shaun Dsouza',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Container(
                                width: 280,
                                child: Text('@ShaunDsouza',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.roboto(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    )),
                              ),
                              SizedBox(height: 15),
                              // Bio
                              Container(
                                width: 280,
                                child: Text('Student at VESIT',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    )),
                              ),
                              SizedBox(height: 15),
                              // Location
                              Container(
                                  width: 280,
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          color: Colors.grey, size: 20),
                                      SizedBox(width: 5),
                                      Text('Mumbai, India',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.roboto(
                                            color: Colors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          )),
                                    ],
                                  )),
                              // Joined Date
                              Container(
                                  width: 280,
                                  child: Row(
                                    children: [
                                      Icon(Icons.calendar_today,
                                          color: Colors.grey, size: 20),
                                      SizedBox(width: 5),
                                      Text('Joined May 2021',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.roboto(
                                            color: Colors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          )),
                                    ],
                                  )),
                              SizedBox(
                                height: 15,
                              ),
                              // Following and Followers
                              Container(
                                  width: 280,
                                  child: Row(
                                    children: [
                                      Text('100',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(width: 5),
                                      Text('Following',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.roboto(
                                            color: Colors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          )),
                                      SizedBox(width: 20),
                                      Text('1,000',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(width: 5),
                                      Text('Followers',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.roboto(
                                            color: Colors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          )),
                                    ],
                                  )),
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 90),
            Container(
                width: double.infinity,
                height: kToolbarHeight,
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    TextButton(
                        onPressed: () {},
                        child: Text('Tweets',
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ))),
                    SizedBox(width: 10),
                    TextButton(
                        onPressed: () {},
                        child: Text('Tweets & Replies',
                            style: GoogleFonts.roboto(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ))),
                    SizedBox(width: 10),
                    TextButton(
                        onPressed: () {},
                        child: Text('Media',
                            style: GoogleFonts.roboto(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ))),
                    SizedBox(width: 10),
                    TextButton(
                        onPressed: () {},
                        child: Text('Likes',
                            style: GoogleFonts.roboto(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ))),
                  ],
                )),
            SizedBox(height: 10),
            Container(
              height: 500,
              //  Invoking the TweetBuilder class to retrieve the tweets from the database
              child:TweetBuilder(),
            ),
          ],
        )));
  }
}
