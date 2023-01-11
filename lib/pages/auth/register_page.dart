import 'package:chatapp_firebase/pages/auth/login_page.dart';
import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey();
  String email = "";
  String password = "";
  String fullName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 80,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Groupie",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Create your account now to chat and explore",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Image.asset("assets/register.png"),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: "Full Name",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      fullName = value;
                    });
                  },
                  // check the validation
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name can't be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  // check the validation
                  validator: (value) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!)
                        ? null
                        : "Please enter a valid email";
                  },
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(
                    labelText: "Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  // check the validation
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Password must be a least 6 character";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      register();
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: "Already have an account! ",
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Login here",
                        style: const TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            nextScreenReplace(context, LoginPage());
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  register() {}
}
