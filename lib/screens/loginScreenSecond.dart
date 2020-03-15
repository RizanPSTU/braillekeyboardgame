import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LoginScreenSecond extends StatefulWidget {
  static const routeName = '/loginScreenSecond';
  LoginScreenSecond({Key key}) : super(key: key);

  @override
  _LoginScreenSecondState createState() => _LoginScreenSecondState();
}

class _LoginScreenSecondState extends State<LoginScreenSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Text(
                  "START LEARNING FOR FREE",
                  style: TextStyle(
                      fontSize: headSceonndtext,
                      color: secondHeadColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '"Braille is knowledge, and knowledge is power." -',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: headThird,
                  color: thirdHeadColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                'Louis Braille.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: headThird,
                  color: thirdHeadColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
