import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/home/profile.dart';

class TweetBuilder extends StatefulWidget {
  final List<int> items;
  final List<bool> isRetweeted;
  final List<bool> isLiked;

  const TweetBuilder(
      {required this.items,
      required this.isLiked,
      required this.isRetweeted,
      super.key});

  @override
  State<TweetBuilder> createState() => _TweetBuilderState();
}

class _TweetBuilderState extends State<TweetBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        child: ListView.builder(
          itemCount: widget.items.length,
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
                        padding: EdgeInsets.only(left: 3, bottom: 60),
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
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ),
                          ),
                        },
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Row(
                              // For the Name and Username
                              children: [
                                Text(widget.items[index].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                SizedBox(width: 5),
                                Text("@" + widget.items[index].toString(),
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
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15)),
                            SizedBox(height: 10),
                            // Contains the like, comment and retweet buttons
                            Row(
                              children: [
                                IconButton(
                                    icon: Image.asset(
                                      "assets/images/${widget.isLiked[index] ? "heart_full" : "heart_empty"}.png",
                                      height: 20,
                                      width: 20,
                                      color: widget.isLiked[index]
                                          ? Colors.red
                                          : Colors.blue,
                                    ),
                                    onPressed: () => {
                                          setState(() {
                                            widget.isLiked[index] =
                                                !widget.isLiked[index];
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
                                      color: widget.isRetweeted[index]
                                          ? Color.fromARGB(255, 12, 215, 19)
                                          : Colors.blue,
                                    ),
                                    onPressed: () => {
                                          setState(() {
                                            widget.isRetweeted[index] =
                                                !widget.isRetweeted[index];
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
        ));
  }
}
