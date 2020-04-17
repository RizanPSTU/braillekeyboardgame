import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/homeScreen.dart';
import 'package:braillekeyboardgame/screens/instructionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class GameEndScreen extends StatefulWidget {
  static const routeName = '/gameEndScreen';
  GameEndScreen({Key key}) : super(key: key);

  @override
  _GameEndScreenState createState() => _GameEndScreenState();
}

class _GameEndScreenState extends State<GameEndScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  '${args["msg"]}',
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
                    args["won"] == "true"
                        ? 'Continue with the next level!'
                        : 'Retry',
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
                    if (args["won"] == "true") {
                      ++indexTrack;
                      setNewLevel(indexTrack);
                      Navigator.of(context)
                          .pushNamed(InstructionScreen.routeName);
                    } else {
                      Navigator.of(context)
                          .pushNamed(InstructionScreen.routeName);
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ProgressButton(
                  defaultWidget: Text(
                    "Goto the main screen",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: headThird,
                      color: Colors.white,
                      //fontStyle: FontStyle.italic,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  progressWidget: CircularProgressIndicator(),
                  borderRadius: 20,
                  width: getPercentSize(80, false, context),
                  height: 80,
                  color: Colors.black,
                  type: ProgressButtonType.Flat,
                  onPressed: () async {
                    if (args["won"] == "true") {
                    } else {
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    }
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
