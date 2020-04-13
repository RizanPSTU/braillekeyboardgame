import 'dart:async';

import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/gameEndScreen.dart';
import 'package:braillekeyboardgame/screens/homeScreen.dart';
import 'package:braillekeyboardgame/widget/brailleSixDotMain.dart';
import 'package:flutter/material.dart';

Timer timer;
int tickCount = 0;
bool isTimeFinished = false;
bool isWon = false;

String wonText = "";
int mainPoint = 0;

class PlayScreen extends StatefulWidget {
  static const routeName = '/playScreen';
  PlayScreen({Key key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  void startTimer() {
    timer = new Timer.periodic(new Duration(seconds: 1), (time) {
      setState(() {
        tickCount = tickCount + 1;
      });
      if (isWon) {
        // print("won hoise");
        Navigator.of(context).pushReplacementNamed(
          GameEndScreen.routeName,
          arguments: {
            "won": "true",
            "time": "false",
            "msg": "$wonText : $mainPoint"
          },
        );
      }

      if (tickCount == timeInt) {
        setState(() {
          isTimeFinished = true;
          if (isTimeFinished) {
            // print("timesesh");
            Navigator.of(context).pushReplacementNamed(
              GameEndScreen.routeName,
              arguments: {"won": "false", "time": "true", "msg": "Retry"},
            );
          }
          time.cancel();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    mainPoint = pointInt;
    wonText = win;

    if (timer != null) {
      if (timer.isActive) {
        timer.cancel();
      }
    }
    isTimeFinished = false;
    isWon = false;

    tickCount = 0;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("$tickCount"),
            Container(
                height: getPercentSize(90, true, context),
                child: BarilleMainSixDot()),
          ],
        ),
      ),
    );
  }
}
