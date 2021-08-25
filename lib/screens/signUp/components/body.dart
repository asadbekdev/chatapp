import 'package:chatapp/constans.dart';
import 'package:chatapp/screens/signUp/components/custom_button.dart';
import 'package:chatapp/screens/signUp/components/custom_text_field.dart';
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
                  GestureDetector(
                    // onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>)),
                    child: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.white70,
                            decoration: TextDecoration.underline,
                          ),
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
