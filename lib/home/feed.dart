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
  List<int> items = [];
  List<bool> isLiked = [];
  List<bool> isRetweeted = [];

  @override
  void initState() {
    super.initState();
    items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    setState(() {
      isLiked = List.generate(items.length, (_) => false);
      isRetweeted = List.generate(items.length, (_) => false);
    });
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
      body: TweetBuilder(items: items,isLiked:isLiked,isRetweeted:isRetweeted),
      bottomNavigationBar: HomeNavBar(),
    );
  }
}
