import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/widget/common_app_bar.dart';

// Firebase Imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class newTweet extends StatefulWidget {
  final profileImage, name, username;
  const newTweet(
      {required this.profileImage,
      required this.name,
      required this.username,
      super.key});

  @override
  State<newTweet> createState() => _newTweetState();
}

class _newTweetState extends State<newTweet> {
  // Data Variables
  String tweetText = "";

  // Firebase Variables defined to fetch data from the database
  FirebaseApp firebaseApp = Firebase.app();
  // Reference to the snapshot i.e data of the collection of the respective firebase app
  late final firestoreRef =
      FirebaseFirestore.instanceFor(app: firebaseApp).collection("tweets");

  // Function to add the tweet to the database
  void addTweet() {
    // Showing a loading modal while the user is being signed in
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    // Adding the tweet to the database
    firestoreRef
        .add({
          "profile_photo": widget.profileImage,
          "name": widget.name,
          "username": widget.username,
          "tweet": tweetText,
          "likes": 0,
          "comments": 0,
          "retweets": 0,
          "timedate": FieldValue.serverTimestamp(),
        })
        .then((value) => {
              // If the tweet is added successfully, then the loading modal is dismissed
              Navigator.pop(context),
              // Navigate to the feed page
              Navigator.pop(context),
            })
        .catchError((error) {
          Navigator.pop(context);
          // If the user is not signed in successfully, then a SnackBar is shown with the error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Error adding tweet'),
              backgroundColor: Colors.blue,
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                label: '',
                onPressed: () {},
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonAppBar(isBack: true, type: "Tweet",onPressed: addTweet,),
          preferredSize: Size.fromHeight(kToolbarHeight)),
      body: SingleChildScrollView(
          child: Row(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 130),
                child: ClipOval(
                    child: Image(
                  image: AssetImage(widget.profileImage),
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  height: 120,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        tweetText = value;
                      });
                    },
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "What's happening?",
                      hintStyle: GoogleFonts.roboto(
                        color: Color.fromARGB(255, 120, 120, 120),
                        fontSize: 20,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 250,
                      height: 40,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.public,
                            color: Colors.blue,
                          ),
                          TextButton(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: 350,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Who can reply?",
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Choose who can reply to this Tweet. Anyone mentioned can always reply. ",
                                            style: GoogleFonts.roboto(
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton.icon(
                                                onPressed: () {},
                                                icon: Icon(Icons.public),
                                                label: Text("Everyone"),
                                              ),
                                              TextButton.icon(
                                                onPressed: () {},
                                                icon: Icon(Icons.people),
                                                label:
                                                    Text("People you follow"),
                                              ),
                                              TextButton.icon(
                                                onPressed: () {},
                                                icon:
                                                    Icon(Icons.alternate_email),
                                                label: Text(
                                                    "Only people you mention"),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                              width: double.infinity,
                                              height: 42,
                                              child: TextButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.white),
                                                      foregroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.black),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18.0),
                                                        side: BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    95,
                                                                    94,
                                                                    94)),
                                                      ))),
                                                  child: Text('Cancel',
                                                      style: GoogleFonts.roboto(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  })),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Everyone can reply",
                              style: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        "assets/images/image.png",
                        height: 24,
                        width: 19,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset(
                        "assets/images/gif.png",
                        height: 24,
                        width: 19,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset(
                        "assets/images/poll.png",
                        height: 24,
                        width: 19,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset(
                        "assets/images/smile.png",
                        height: 24,
                        width: 19,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset(
                        "assets/images/schedule.png",
                        height: 24,
                        width: 19,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
