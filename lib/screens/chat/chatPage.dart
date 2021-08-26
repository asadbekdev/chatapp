import 'package:chatapp/constans.dart';
import 'package:chatapp/screens/chat/components/body.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: kPadding),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/mycat.jpg"),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: kPadding - 5),
          child: Row(
            children: [
              SizedBox(width: kPadding - 5),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hintText: 'Search',
                      hintStyle:
                          Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: Colors.white70,
                              ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Body(),
    );
  }
}
