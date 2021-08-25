import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
