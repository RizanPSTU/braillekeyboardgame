import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginScreeen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              Text(
                "WELCOME",
                style: TextStyle(
                    fontSize: heatext,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "BRAILLING!",
                style: TextStyle(
                    fontSize: heatext,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Text(
                  "BRAILLE ON YOUR PHONE",
                  style: TextStyle(
                      fontSize: headSceonndtext,
                      color: secondHeadColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "We need you to signup with any of these social accounts to start learning!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: headThird,
                    color: thirdHeadColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Text(
                  "Connect using social media",
                  style: TextStyle(
                      fontSize: bottomText,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: hightAndWidthOfSocialButton,
                    width: hightAndWidthOfSocialButton,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Icon(
                      FontAwesome.facebook,
                      color: Colors.blue,
                      size: iconSize,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: hightAndWidthOfSocialButton,
                    width: hightAndWidthOfSocialButton,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Icon(
                      FontAwesome.google,
                      color: Colors.red,
                      size: iconSize,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
