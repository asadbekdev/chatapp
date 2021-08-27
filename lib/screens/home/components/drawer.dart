import 'package:chatapp/constans.dart';
import 'package:chatapp/screens/signUp/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  var user;
  CustomDrawer({Key? key,this.user}) : super(key: key);
  FirebaseAuth _authUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: kBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: user["profileImageUrl"] != ""
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(
                            user["profileImageUrl"].toString(),
                          ),
                          radius: 40.0,
                        )
                      : CircleAvatar(
                          child: Text(
                            "${user["username"][0]}".toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white70),
                          ),
                          radius: 40.0,
                        ),
                ),
                SizedBox(height: kPadding),
                Text(
                  user["username"].toString(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ElevatedButton(
            child: Text("Sign Out"),
            onPressed: () async {
              await _authUser.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
