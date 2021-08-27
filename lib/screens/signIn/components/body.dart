import 'package:chatapp/constans.dart';
import 'package:chatapp/components/custom_button.dart';
import 'package:chatapp/components/custom_text_field.dart';
import 'package:chatapp/screens/home/homePage.dart';
import 'package:chatapp/screens/signUp/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kPadding, vertical: kPadding),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.4),
                    CustomTextField(
                      hintText: 'Email',
                      usernameController: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        var regex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (regex.hasMatch(val)) {
                          return null;
                        } else {
                          return "Enter correct email";
                        }
                      },
                    ),
                    SizedBox(height: kPadding),
                    CustomTextField(
                      hintText: 'Password',
                      usernameController: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (val) {
                        if (val == null || val.length < 6) {
                          return "Enter 6 characters at least";
                        }
                      },
                    ),
                    SizedBox(height: kPadding * 1.5),
                    CustomButton(
                      text: 'Sign In',
                      onPressed: signIn,
                    ),
                    SizedBox(height: kPadding),
                    CustomButton(
                      text: 'Sign In with Google',
                      onPressed: () {},
                    ),
                    SizedBox(height: kPadding / 1.2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: Colors.white70,
                                  ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          ),
                          child: Text(
                            "Sign Up",
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
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

  signIn() async {
    UserCredential? userCredential;
    if (_formKey.currentState!.validate()) {
      //SIGN IN
      try {
        setState(() {
          isLoading = true;
        });
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (userCredential.user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No user found for that email.")),
          );
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Wrong password provided for that user.")),
          );
        }
      }
    }
  }
}
