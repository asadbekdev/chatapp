import 'package:chatapp/constans.dart';
import 'package:chatapp/screens/home/components/body.dart';
import 'package:chatapp/screens/home/components/drawer.dart';
import 'package:chatapp/screens/signUp/sign_up.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _authUser = FirebaseAuth.instance;
  var user;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kBackgroundColor,
      drawer: CustomDrawer(user: user),
      body: Body(
        scaffoldKey: _scaffoldKey,
      ),
    );
  }

  getCurrentUser() async {
    await for (var snapshot in _firestore.collection('users').snapshots()) {
      for (var item in snapshot.docs) {
        if (item["email"] == _authUser.currentUser!.email) {
          setState(() {
            user = item;
          });
        }
      }
    }
  }
}
