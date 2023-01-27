import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/widget/home_app_bar.dart';
import 'package:twitter/widget/home_nav_bar.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  bool isLiked = false;
  bool isRetweeted = false;

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
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          // It returns a container that contains the tweet
          return Container(
            padding: EdgeInsets.only(right: 10),
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.only(left: 3, bottom: 20),
                      // Using ClipOval to clip the image to a circle
                      icon: ClipOval(
                          child: Image.network(
                        "https://cdn.hswstatic.com/gif/play/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg",
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      )),
                      iconSize: 60,
                      alignment: Alignment.centerLeft,
                      // TODO : Add the onPressed function to open profile page
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            // For the Name and Username
                            children: [
                              Text(items[index].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              SizedBox(width: 5),
                              Text("@" + items[index].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15)),
                            ],
                          ),
                          SizedBox(height: 10),
                          // For the Tweet
                          Text(
                              "🚨BREAKING: Chelsea and Lyon have completed a £30m deal for Malo Gusto. Personal terms already agreed, Malo Gusto is in love with Ruben Loftus Cheek. 🔵🇫🇷 #cfc",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 15)),
                          SizedBox(height: 10),
                          // Contains the like, comment and retweet buttons
                          Row(
                            children: [
                              IconButton(
                                  icon: Image.asset(
                                    "assets/images/${isLiked ? "heart_full": "heart_empty"}.png",
                                    height: 20,
                                    width: 20,
                                    color: isLiked ? Colors.red :  Colors.blue,
                                  ),
                                  onPressed: () => {
                                    setState(() {
                                      isLiked = !isLiked;
                                    })
                                  }),
                              Padding(
                                padding: EdgeInsets.only(right: 15.0),
                                child: Text("1.2K",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15)),
                              ),
                              IconButton(
                                  icon: Image.asset(
                                    "assets/images/comment_empty.png",
                                    height: 20,
                                    width: 20,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () => {}),
                              Padding(
                                padding: EdgeInsets.only(right: 15.0),
                                child: Text("1.2K",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15)),
                              ),
                              IconButton(
                                  icon: Image.asset(
                                    "assets/images/retweet_clicked.png",
                                    height: 40,
                                    width: 40,
                                    color: isRetweeted ? Color.fromARGB(255, 12, 215, 19) : Colors.blue,
                                  ),
                                  onPressed: () => {
                                    setState(() {
                                      isRetweeted = !isRetweeted;
                                    })
                                  }),
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text("1.2K",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15)),
                              ),
                              IconButton(
                                  icon: Image.asset(
                                    "assets/images/more.png",
                                    height: 15,
                                    width: 15,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () => {}),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: HomeNavBar(),
    );
  }
}
