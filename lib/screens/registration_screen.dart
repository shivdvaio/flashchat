import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components.dart';

import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "Regscreen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: kTextfieldinputdecoration.copyWith(
                  hintText: 'Enter your Email',
                )),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              style: TextStyle(color: Colors.white, fontSize: 20),
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
                password = value;
              },
              decoration: kTextfieldinputdecoration.copyWith(
                  hintText: 'Enter your Password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RounndedButton(
              colour: Colors.blue,
              text: 'Register',
              onPressed: () async {
                try {
                  final Newuser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if(email !=null){
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                }
                catch(e){
                  print(e);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
