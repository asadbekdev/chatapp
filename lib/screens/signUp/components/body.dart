import 'dart:io';

import 'package:chatapp/constans.dart';
import 'package:chatapp/screens/signIn/sign_in.dart';
import 'package:chatapp/components/custom_button.dart';
import 'package:chatapp/components/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  File? localPic;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _authUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kPadding, vertical: kPadding),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.35),
                    // USERNAME FIELD SECTION
                    CustomTextField(
                      hintText: 'Username',
                      controller: _usernameController,
                      keyboardType: TextInputType.name,
                      validator: (val) {
                        if (val == null || val.isEmpty || val.length < 3) {
                          return 'Enter more than 3 characters';
                        }
                      },
                    ),
                    SizedBox(height: kPadding),

                    // EMAIL FIELD SECTION
                    CustomTextField(
                      hintText: 'Email',
                      controller: _emailController,
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

                    // PASSWORD FIELD SECTION
                    CustomTextField(
                      hintText: 'Password',
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (val) {
                        if (val == null || val.length < 6) {
                          return "Enter 6 characters at least";
                        }
                      },
                    ),
                    SizedBox(height: kPadding * 1.5),

                    // SIGNUP BUTTON SECTION
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: signUp,
                    ),
                    SizedBox(height: kPadding),

                    // SIGNUP BUTTON SECTION
                    CustomButton(
                      text: 'Sign Up with Google',
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
                              builder: (context) => SignIn(),
                            ),
                          ),
                          child: Text(
                            "Sign In",
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

  signUp() async {
    // ignore: unused_local_variable
    UserCredential? userCredential;
    if (_formKey.currentState!.validate()) {
      // CREATING USER
      try {
        userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.toString(),
          password: _passwordController.text.toString(),
        );
        userCredential.user!.updateDisplayName(_usernameController.text);
        if (_authUser.currentUser!.uid.isNotEmpty) {
          // ADDING USER TO FIRESTORE DATABASE
          await _firestore
              .collection('users')
              .doc('${_usernameController.text}')
              .set(
            {
              "username": "${_usernameController.text}",
              "email": "${_emailController.text}",
              "password": "${_passwordController.text}",
              "profileImageUrl": "",
            },
          );
          // SIGN OUT USER
          await _authUser.signOut();

          // DIRECTING TO SIGNIN PAGE
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignIn()),
          );
          setState(() {
            isLoading = true;
          });
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              content: Text("The password provided is too weak."),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              content: Text("The account already exists for that email."),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            content: Text("e"),
          ),
        );
      }
    }
  }
}
