import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/loginScreenThird.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

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
              Semantics(
                button: true,
                label: "Braille Logo",
                child: Container(
                  height: 250,
                  width: 250,
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Text(
                  "¡Aprendé braille gratis!",
                  style: TextStyle(
                      fontSize: headSceonndtext,
                      color: secondHeadColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  '“El braille es conocimiento y el conocimiento es poder”. — ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: headThird,
                    color: thirdHeadColor,
                    fontStyle: FontStyle.italic,
                  ),
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
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ProgressButton(
                  defaultWidget: Text(
                    'Click para empezar.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: headThird,
                      color: Colors.black,
                      //fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  progressWidget: CircularProgressIndicator(),
                  borderRadius: 20,
                  width: getPercentSize(80, false, context),
                  height: 60,
                  color: Colors.white,
                  type: ProgressButtonType.Flat,
                  onPressed: () async {
                    Navigator.of(context)
                        .pushReplacementNamed(LoginScreenThird.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
