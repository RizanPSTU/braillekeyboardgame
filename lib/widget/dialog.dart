import 'dart:ui';
import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/homeScreen.dart';
import 'package:braillekeyboardgame/screens/playScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class BraileDialog extends StatelessWidget {
  const BraileDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                '¿Queréssalir deljuego?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: headThird,
                  color: thirdHeadColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ProgressButton(
                defaultWidget: Text(
                  '¡Si! Despuésvuelvo',
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
                height: 80,
                color: Colors.white,
                type: ProgressButtonType.Flat,
                onPressed: () async {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ProgressButton(
                defaultWidget: Text(
                  "No, sigojugando",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: headThird,
                    color: Colors.white,
                  ),
                ),
                progressWidget: CircularProgressIndicator(),
                borderRadius: 20,
                width: getPercentSize(80, false, context),
                height: 80,
                color: Colors.black,
                type: ProgressButtonType.Flat,
                onPressed: () async {
                  isPaused = false;
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
