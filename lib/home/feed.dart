// Imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/home/new_tweet.dart';
import 'package:twitter/home/profile.dart';
import 'package:twitter/widget/app_drawer.dart';
import 'package:twitter/widget/home_app_bar.dart';
import 'package:twitter/widget/home_nav_bar.dart';
import 'package:twitter/widget/tweet_builder.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Returns a Scaffold widget
    // TODO : Implement the Feed UI
    return Scaffold(
      // Setting the key to use it in the drawer
      key: _scaffoldKey,
      // Setting PrefferedSize for the AppBar to the height of the toolbar which automatically varies as per phone size
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                ),
              ),
            ),
            child: HomeAppBar(scaffoldRef: _scaffoldKey)),
      ),
      drawer: AppDrawer(),
      // List View Builder to build the list of tweets
      // It also provides infinite scrolling
      body: TweetBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the new tweet page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => newTweet(profileImage: "assets/images/profile-photo.jpg",name:"Shaun Dsouza",username:"shaundsouza",),
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: ClipOval(
        child : Image(image: AssetImage("assets/images/new-tweet.png"),
        height: 150,
        width:150,
        fit: BoxFit.cover,)
        )
          
      ),
      bottomNavigationBar: HomeNavBar(),
    );
  }
}
