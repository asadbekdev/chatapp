import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTabBar extends StatelessWidget {
  var controller;
  CustomTabBar({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.transparent,
      controller: controller,
      labelStyle: TextStyle(
          fontWeight: FontWeight.w500, color: Colors.white70, fontSize: 17.0),
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w400, color: Colors.white10, fontSize: 16.0),
      tabs: [
        Tab(
          child: Text("Messages"),
        ),
        Tab(
          child: Text("Groups"),
        ),
        Tab(
          child: Text("Personal"),
        ),
      ],
    );
  }
}
