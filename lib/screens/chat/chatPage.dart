import 'package:chatapp/constans.dart';
import 'package:chatapp/screens/chat/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  var profilePic, username, status, time, onPressed;
  ChatPage(
      {Key? key,
      required this.username,
      required this.status,
      required this.profilePic,
      required this.onPressed,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        leadingWidth: 30,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          // padding: EdgeInsets.symmetric(horizontal: kPadding - 5),
        ),
        title: InkWell(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: kPadding / 2),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profilePic.toString()),
                ),
                SizedBox(width: kPadding - 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        username.toString(),
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white70, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        status.toString(),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.white54, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: kPadding - 5),
                    Icon(CupertinoIcons.videocam_fill),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Body(),
    );
  }
}
