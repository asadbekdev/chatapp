import 'package:chatapp/constans.dart';
import 'package:chatapp/screens/chat/chatPage.dart';
import 'package:chatapp/screens/home/components/message_item.dart';
import 'package:chatapp/screens/home/components/tabBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  GlobalKey<ScaffoldState>? scaffoldKey;
  Body({Key? key, this.scaffoldKey}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: kPadding / 2),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            // APPBAR and SEARCH SECTION
            SafeArea(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPadding),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/mycat.jpg"),
                        ),
                        onTap: () {
                          widget.scaffoldKey!.currentState!.openDrawer();
                        },
                      ),
                      SizedBox(width: kPadding),
                      Expanded(
                        child: TextFormField(
                          autocorrect: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Search',
                            hintStyle:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: Colors.black45,
                                    ),
                            prefixIcon: Icon(CupertinoIcons.search,
                                color: Colors.black87),
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: kPadding / 2),
            // CATEGORIES SECTION TABBAR
            Container(
              child: CustomTabBar(
                controller: _tabController,
              ),
            ),
            // CATEGORIES TABVIEW
            Expanded(
              child: Container(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // FIRST TAB
                    Container(
                      child: Column(
                        children: [
                          MessageItem(
                            profilePic:
                                "https://yt3.ggpht.com/ytc/AKedOLS3g5vlmWiRh9-3aqN_oARKzPcJ4MsezHQfZR6J=s900-c-k-c0x00ffffff-no-rj",
                            username: "Asadbek Noyibjonov",
                            lastMsg: "Hey What are you doing? ",
                            time: "New",
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage(
                                  profilePic: "assets/images/mycat.jpg",
                                  username: "Asadbek Noyibjonov",
                                  status: "online",
                                  time: "New",
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SECOND TAB
                    Container(
                      child: Text("Groups"),
                    ),
                    // THIRD TAB
                    Container(
                      child: Text("Personal"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
