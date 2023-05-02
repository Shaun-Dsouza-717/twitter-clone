import 'package:flutter/material.dart';
import 'package:twitter/auth/login.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Column(children: [
              Container(
                padding: EdgeInsets.only(top:10,left: 20.0),
                  alignment: Alignment.centerLeft,

                  child: ClipOval(
                      child: Image(
                    image: AssetImage("assets/images/profile-photo.jpg"),
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ))),
              Container(
                height: 40.0,
                padding: EdgeInsets.only(left: 20.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                  child: Text(
                    'Shaun Dsouza',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

              ),
                Container(
                margin: EdgeInsets.only(bottom: 15.0),
                padding: EdgeInsets.only(left: 20.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                  child: Text(
                    '@shaundsouza',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

              ),
            ]),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.blue),
              title: Text('Log out'),
              onTap: () {
                // Pop twice first to remove the drawer and second to remove the screen
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
