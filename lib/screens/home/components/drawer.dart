import 'package:chatapp/components/custom_text_field.dart';
import 'package:chatapp/constans.dart';
import 'package:chatapp/screens/signUp/sign_up.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  var user;
  GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey<ScaffoldState>();
  CustomDrawer({Key? key, this.user, this.scaffoldKey}) : super(key: key);
  FirebaseAuth _authUser = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _groupNameController = TextEditingController();
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
            title: Text('New Group'),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (contex) {
                  return SimpleDialog(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kPadding, vertical: kPadding),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: _groupNameController,
                                hintText: "Enter groupname...",
                                keyboardType: TextInputType.text,
                                validator: (val) {
                                  if (val == null && val.length < 3) {
                                    return 'Enter 3 characters at least';
                                  }
                                },
                              ),
                              SizedBox(height: kPadding / 2),
                              ElevatedButton(
                                child: Text("Create group"),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await _firestore
                                        .collection('groups')
                                        .doc(_groupNameController.text)
                                        .set(
                                      {
                                        "groupName": _groupNameController.text,
                                        "groupPhoto": "",
                                      },
                                      SetOptions(merge: true),
                                    );
                                    _firestore
                                        .collection('groups')
                                        .doc(_groupNameController.text)
                                        .collection('msg')
                                        .doc();
                                  }
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
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
