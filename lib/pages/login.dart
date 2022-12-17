// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:notesapp/controller/googleauth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("android/assets/images/coverbw.png"))),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              child: Text(
                "Create and Manage your Notes",
                style: TextStyle(
                  fontFamily: "lato",
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  signInWithGoogle(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(50, 255, 206, 0.5)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Continue with Google ",
                      style: TextStyle(
                        fontFamily: "lato",
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Image.asset(
                      "android/assets/images/google.png",
                      height: 26.0,
                      width: 26.0,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
