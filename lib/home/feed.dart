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
  List<Map<String, dynamic>> items = [];
  List<bool> isLiked = [];
  List<bool> isRetweeted = [];
  FirebaseDatabase database = FirebaseDatabase.instance;
  final tweetRef = FirebaseDatabase.instance.ref().child('tweets');

  @override
  void initState() {
    super.initState();
    // tweetRef.once().then((event) {
    //   final snapshot = event.snapshot;
    //   Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
    //   values.forEach((key, value) {
    //     items.add(value);
    //   });
    // });
    setState(() {
      items = [
        {
          "tweet_id": 1,
          "profile_photo":
              "https://pbs.twimg.com/profile_images/1439895378543906818/jYPAye0I_400x400.jpg",
          "name": "Bayern Munich",
          "username": "@FCBayern",
          "tweet":
              "We're back in the Champions League! 🏆\n\n#UCL #MiaSanMia #FCBayern",
          "likes": 100,
          "retweets": 50,
          "comments": 20,
          "timedate": "2023-02-05 12:00:00"
        },
        {
          "tweet_id": 2,
          "profile_photo":
              "https://pbs.twimg.com/profile_images/1542768398727249920/-neNiKE9_400x400.jpg",
          "name": "FC Barcelona",
          "username": "@FCBarcelona",
          "tweet":
              "We're La Liga Champions ! 🏆\n\n#LaLiga #ForçaBarça #FCBarcelona",
          "likes": 150,
          "retweets": 15,
          "comments": 10,
          "timedate": "2023-02-04 12:00:00"
        },
        {
          "tweet_id": 3,
          "profile_photo":
              "https://pbs.twimg.com/profile_images/1456279146288619522/qdrDtPeH_400x400.jpg",
          "name": "Kylian Mbappe",
          "username": "@KMbappe",
          "tweet":
              "United are the smallest Football Club in the world ! 🤣🤣🤣\n\n#UCL #ForçaBarça #FCBarcelona",
          "likes": 1200,
          "retweets": 150,
          "comments": 120,
          "timedate": "2023-02-03 12:00:00"
        },
        {
          "tweet_id": 4,
          "profile_photo":
              "https://pbs.twimg.com/profile_images/1588193737460645888/5TMfaLz2_400x400.png",
          "name": "Real Madrid",
          "username": "@realmadrid",
          "tweet": "We're owned by Barcelona😭😭! #HalaMadrid #RealMadrid",
          "likes": 100,
          "retweets": 50,
          "comments": 20,
          "timedate": "2023-02-02 12:00:00"
        }
      ];
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
      body: TweetBuilder(
          items: items, isLiked: isLiked, isRetweeted: isRetweeted),
      bottomNavigationBar: HomeNavBar(),
    );
  }
}
