import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/home/profile.dart';
import 'package:twitter/main.dart';
import 'package:intl/intl.dart';

class TweetBuilder extends StatefulWidget {
  const TweetBuilder({super.key});

  @override
  State<TweetBuilder> createState() => _TweetBuilderState();
}

class _TweetBuilderState extends State<TweetBuilder> {
  // Data Variables
  List<bool> isLiked = [];
  List<bool> isRetweeted = [];
  // Firebase Variables defined to fetch data from the database
  FirebaseApp firebaseApp = Firebase.app();
  // Reference to the snapshot i.e data of the collection of the respective firebase app
  late final firestoreRef = FirebaseFirestore.instanceFor(app: firebaseApp)
      .collection("tweets")
      .orderBy("timedate", descending: true)
      .snapshots();

  String getTimeDifference(Timestamp timestamp) {
    DateTime postTime = timestamp.toDate();
    DateTime currentTime = DateTime.now();
    Duration difference = currentTime.difference(postTime);

    if (difference.inDays > 30) {
      return DateFormat('MMM d').format(postTime);
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'now';
    }
  }
  // // Function to like a tweet
  // void likeTweet(int index, List<Map<String, dynamic>> tweets) {
  //   // If the tweet is already liked then unlike it
  //   if (isLiked[index]) {
  //     // Decrementing the like count
  //     FirebaseFirestore.instanceFor(app: firebaseApp)
  //         .collection("tweets")
  //         .doc(tweets[index]["id"])
  //         .update({"likes": tweets[index]["likes"] - 1});
  //   }
  //   // If the tweet is not liked then like it
  //   else {
  //     // Incrementing the like count
  //     FirebaseFirestore.instanceFor(app: firebaseApp)
  //         .collection("tweets")
  //         .doc(tweets[index]["id"])
  //         .update({"likes": tweets[index]["likes"] + 1});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        // Using StreamBuilder to fetch the snapshots to build the list of tweets
        child: StreamBuilder<QuerySnapshot>(
          // Passing the reference to the snapshots
          stream: firestoreRef,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //  If the connection is waiting then show a circular progress indicator
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Showing a loading modal while the tweets are being fetched
              return CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 1,
              );
            }
            // If there is an error then show a text widget with the error
            if (snapshot.hasError) {
              return Text("Error");
            }
            //  If the connection is active then initialize the lists of isLiked and isRetweeted and return the ListView.builder
            // isLiked = List.generate(snapshot.data!.docs.length, (_) => false);
            // isRetweeted = List.generate(snapshot.data!.docs.length, (_) => false);

                // Updating the length of isLiked and isRetweeted lists
            if (isLiked.length < snapshot.data!.docs.length) {
              isLiked.addAll(List.generate(
                  snapshot.data!.docs.length - isLiked.length, (_) => false));
            }
            if (isRetweeted.length < snapshot.data!.docs.length) {
              isRetweeted.addAll(List.generate(
                  snapshot.data!.docs.length - isRetweeted.length,
                  (_) => false));
            }

            return ListView.builder(
              // Setting the itemCount to the length of the snapshot
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                // Getting the timestamp of the tweet
                Timestamp timestamp = snapshot.data!.docs[index]['timedate'];

                // Getting the time difference between the current time and the time the tweet was posted
                String timeAgo = getTimeDifference(timestamp);

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
                              child: Image(
                                image: snapshot
                                        .data!.docs[index]["profile_photo"]
                                        .startsWith("assets")
                                    ? AssetImage(snapshot.data!.docs[index]
                                        ["profile_photo"])
                                    : NetworkImage(snapshot.data!.docs[index]
                                            ["profile_photo"])
                                        as ImageProvider<Object>,
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),

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
                                    Text(snapshot.data!.docs[index]["name"],
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    SizedBox(width: 5),
                                    Text(
                                        "@" +
                                            snapshot.data!.docs[index]
                                                ["username"],
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15)),
                                    SizedBox(width: 5),
                                    Text("·",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15)),
                                    SizedBox(width: 5),
                                    Text(timeAgo,
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                // For the Tweet
                                Container(
                                    width: double.infinity,
                                child: Text(snapshot.data!.docs[index]["tweet"],
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15))),
                                SizedBox(height: 10),
                                // Contains the like, comment and retweet buttons
                                Row(
                                  children: [
                                    IconButton(
                                        icon: Image.asset(
                                          "assets/images/${isLiked[index] ? "heart_full" : "heart_empty"}.png",
                                          height: 20,
                                          width: 20,
                                          color: isLiked[index] == true
                                              ? Colors.red
                                              : Colors.blue,
                                        ),
                                        onPressed: () => {
                                              setState(() {
                                                print("Liked");
                                                isLiked[index] =
                                                    !isLiked[index];
                                                print(isLiked);
                                              })
                                            }),
                                    Padding(
                                      padding: EdgeInsets.only(right: 15.0),
                                      child: Text(
                                           (snapshot.data!.docs[index]["likes"]   + (isLiked[index] ? 1 : 0))                                             
                                              .toString(),
                                          style: GoogleFonts.roboto(
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
                                      child: Text(
                                          snapshot.data!.docs[index]["comments"]
                                              .toString(),
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15)),
                                    ),
                                    IconButton(
                                        icon: Image.asset(
                                          "assets/images/retweet_clicked.png",
                                          height: 40,
                                          width: 40,
                                          color: isRetweeted[index]
                                              ? Color.fromARGB(255, 12, 215, 19)
                                              : Colors.blue,
                                        ),
                                        onPressed: () => {
                                              setState(() {
                                                isRetweeted[index] =
                                                    !isRetweeted[index];
                                              })
                                            }),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Text(
                                          snapshot.data!.docs[index]["retweets"]
                                              .toString(),
                                          style: GoogleFonts.roboto(
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
                                        onPressed: () {}),
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
            );
          },
        ));
  }
}
