import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DatabaseModels extends StatelessWidget {
  DatabaseModels({Key? key}) : super(key: key);
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  getAllChat() async {
    await for (var snapshot in _firestore.collection('users').snapshots()) {
      for (var doc in snapshot.docs) {
        print("doc" + doc.id);
        return snapshot.docs;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
