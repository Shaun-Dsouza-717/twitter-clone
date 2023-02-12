import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/home/profile.dart';
import 'package:twitter/main.dart';

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
      .snapshots();

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
              return CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 2,
              );
            }
            // If there is an error then show a text widget with the error
            if (snapshot.hasError) {
              return Text("Error");
            }
            //  If the connection is active then initialize the lists of isLiked and isRetweeted and return the ListView.builder
            isLiked = List.generate(snapshot.data!.docs.length, (_) => false);
            isRetweeted = List.generate(snapshot.data!.docs.length, (_) => false);

            return ListView.builder(
              // Setting the itemCount to the length of the snapshot
              itemCount: snapshot.data!.docs.length,
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
                              snapshot.data!.docs[index]["profile_photo"],
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
                                    Text(snapshot.data!.docs[index]["name"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    SizedBox(width: 5),
                                    Text(
                                        "@" +
                                            snapshot.data!.docs[index]
                                                ["username"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                // For the Tweet
                                Text(snapshot.data!.docs[index]["tweet"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15)),
                                SizedBox(height: 10),
                                // Contains the like, comment and retweet buttons
                                Row(
                                  children: [
                                    IconButton(
                                        icon: Image.asset(
                                          "assets/images/${isLiked[index] ? "heart_full" : "heart_empty"}.png",
                                          height: 20,
                                          width: 20,
                                          color: isLiked[index]
                                              ? Colors.red
                                              : Colors.blue,
                                        ),
                                        onPressed: () => {
                                              setState(() {
                                                isLiked[index] =
                                                    !isLiked[index];
                                              })
                                            }),
                                    Padding(
                                      padding: EdgeInsets.only(right: 15.0),
                                      child: Text(
                                          snapshot.data!.docs[index]["likes"]
                                              .toString(),
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
                                      child: Text(
                                          snapshot.data!.docs[index]["comments"]
                                              .toString(),
                                          style: TextStyle(
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
