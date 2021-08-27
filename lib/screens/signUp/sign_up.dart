import 'package:chatapp/screens/signUp/components/body.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Chat App",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.white),
        ),
        centerTitle: true,
        actions: [],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Body(),
    );
  }
}
