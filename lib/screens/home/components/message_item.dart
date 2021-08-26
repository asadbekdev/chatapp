import 'package:chatapp/constans.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessageItem extends StatelessWidget {
  var profilePic, username, lastMsg, time, onPressed;
  MessageItem({
    Key? key,
    required this.profilePic,
    required this.lastMsg,
    required this.username,
    required this.time,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: kPadding, vertical: kPadding / 2),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        lastMsg.toString(),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.white54, fontWeight: FontWeight.w400),
                      ),
                      // Last Message Time
                      Text(
                        time.toString(),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.white54, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
