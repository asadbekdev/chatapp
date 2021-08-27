import 'package:chatapp/constans.dart';
import 'package:chatapp/models/auth_services.dart';
import 'package:chatapp/screens/signIn/sign_in.dart';
import 'package:chatapp/components/custom_button.dart';
import 'package:chatapp/components/custom_text_field.dart';
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
  GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();

  bool isLoading = false;
  AuthService authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
                usernameController: _usernameController,
                keyboardType: TextInputType.name,
                validator: (val) {
                  if (val.isEmpty || val.length < 3) {
                    return 'Enter more than 3 characters';
                  }
                },
              ),
              SizedBox(height: kPadding),

              // EMAIL FIELD SECTION
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

              // PASSWORD FIELD SECTION
              CustomTextField(
                hintText: 'Password',
                usernameController: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (val) {
                  if (val.length < 4) {
                    return "Enter 4 characters at least";
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
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
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

  signUp() async {
    setState(() {
      isLoading = true;
    });

    if (_formKey.currentState!.validate()) {
      await authService
          .signUpWithEmailAndPassword(
              _emailController.text, _passwordController.text)
          .then(
        (value) {
          if (value != null) {
            print(value.toString());
          }
        },
      );
    }
  }
}
