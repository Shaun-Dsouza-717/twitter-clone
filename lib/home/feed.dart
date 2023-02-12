// Imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/home/profile.dart';
import 'package:twitter/widget/home_app_bar.dart';
import 'package:twitter/widget/home_nav_bar.dart';
import 'package:twitter/widget/tweet_builder.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {


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
            child: HomeAppBar()),
      ),
      // List View Builder to build the list of tweets
      // It also provides infinite scrolling
      body: TweetBuilder(),
      bottomNavigationBar: HomeNavBar(),
    );
  }
}
