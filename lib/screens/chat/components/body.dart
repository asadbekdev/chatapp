import 'package:chatapp/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.redAccent,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: kPadding / 2, vertical: kPadding),
            color: Color(0xFF131313),
            child: Row(
              children: [
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
                      prefixIcon:
                          Icon(CupertinoIcons.search, color: Colors.black87),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
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
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.cloud_upload),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
