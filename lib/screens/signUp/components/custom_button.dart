import 'package:chatapp/constans.dart';
import 'package:flutter/material.dart';

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

