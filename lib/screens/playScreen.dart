import 'dart:async';

import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/homeScreen.dart';
import 'package:braillekeyboardgame/widget/brailleSixDotMain.dart';
import 'package:flutter/material.dart';

Timer timer;
int tickCount = 0;
bool isTimeFinished = false;

class PlayScreen extends StatefulWidget {
  static const routeName = '/playScreen';
  PlayScreen({Key key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  void startTimer() {
    // Start the periodic timer which prints something after 5 seconds and then stop it .

    timer = new Timer.periodic(new Duration(seconds: 1), (time) {
      // print('Something');
      // print('${time.tick}');
      setState(() {
        tickCount = tickCount + 1;
      });
      if (tickCount == timeInt) {
        setState(() {
          isTimeFinished = true;
          time.cancel();
        });
      }
      // time.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    if (timer != null) {
      if (timer.isActive) {
        timer.cancel();
      }
    }

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
