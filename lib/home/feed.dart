import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/widget/home_app_bar.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    // Returns a Scaffold widget
    // TODO : Implement the Feed UI
    return Scaffold(
      // Setting PrefferdSize for the AppBar to the height of the toolbar which automatically varies as per phone size 
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), child: HomeAppBar()),
    );
  }
}
