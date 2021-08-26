import 'package:chatapp/constans.dart';
import 'package:chatapp/screens/home/components/message_item.dart';
import 'package:chatapp/screens/home/components/tabBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

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
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/mycat.jpg"),
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
                            profilePic: "assets/images/mycat.jpg",
                            username: "Asadbek Noyibjonov",
                            lastMsg: "Hey What are you doing? ",
                            time: "New",
                            onPressed: () {},
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
