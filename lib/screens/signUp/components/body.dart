import 'package:chatapp/constans.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    GlobalKey _key = GlobalKey<FormFieldState>();
    TextEditingController _usernameController = TextEditingController();
    return SingleChildScrollView(
      child: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kPadding, vertical: kPadding),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.35),
              CustomTextField(
                hintText: 'Username',
                usernameController: _usernameController,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: kPadding),
              CustomTextField(
                hintText: 'Email',
                usernameController: _usernameController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: kPadding),
              CustomTextField(
                hintText: 'Password',
                usernameController: _usernameController,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: kPadding * 1.5),
              CustomButton(
                onPressed: () {},
                text: 'Sign Up',
              ),
              SizedBox(height: kPadding),
              CustomButton(
                onPressed: () {},
                text: 'Sign Up with Google',
              ),
              SizedBox(height: kPadding / 1.2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                  Text(
                    "Sign In",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Colors.white70,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  var onPressed, text;
  CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(
                "$text",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black87,
                    ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: kPadding),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                shadowColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  var validator, usernameController, keyboardType, hintText;

  CustomTextField({
    Key? key,
    required this.usernameController,
    required this.hintText,
    required this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        keyboardType: keyboardType,
        controller: usernameController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: Colors.white70,
              ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
