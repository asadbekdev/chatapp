import 'package:chatapp/screens/signUp/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class Init extends StatelessWidget {
  Init({Key? key}) : super(key: key);
  final Future<FirebaseApp> _init = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Text("There is Error on Firebase ! (Error Page)"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return SignUp();
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
