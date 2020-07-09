import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components.dart';

class RounndedButton extends StatelessWidget {
  final Color colour;
  final String text;
  final Function onPressed;

  RounndedButton({this.colour,this.text,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 65.0,
          child: Text(
              text
              ,style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}