import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components.dart';
import 'package:flash_chat/components.dart';


class WelcomeScreen extends StatefulWidget {
  static String id = 'welcomescreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation =
        ColorTween(begin: Colors.red, end: Colors.black).animate(controller);
//
//    animation = CurvedAnimation(parent: controller, curve: Curves.easeInQuad);
//
//    controller.forward();
//    controller.addStatusListener((status) {
//      if (status == AnimationStatus.completed) {
//        controller.reverse(from: 1.0);
//      } else if (status == AnimationStatus.dismissed) {
//
//      }
//    });

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/shiv.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black26.withOpacity(0.2), BlendMode.dstATop))),
        child: Scaffold(
          backgroundColor: Colors.white10.withOpacity(0.2),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: 60,
                      ),
                    ),
                    Expanded(
                      child: TyperAnimatedTextKit(
                        isRepeatingAnimation: false,
                        text: ['Hey Shiv D Vaio'],
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.0,
                ),
                RounndedButton(
                  colour: Colors.lightBlueAccent,
                  text: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                RounndedButton(
                  colour: Colors.blueAccent,
                  text: 'Register',
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
