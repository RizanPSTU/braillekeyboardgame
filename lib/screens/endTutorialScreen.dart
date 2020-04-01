import 'package:braillekeyboardgame/backend/auth.dart';
import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class EndTutorialScreen extends StatefulWidget {
  static const routeName = '/endTutorialScreen';
  EndTutorialScreen({Key key}) : super(key: key);

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<EndTutorialScreen> {
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
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  'Are you ready for the next lesson? Keep playing !',
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
                    'Start learning',
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
                    await oldToNew();
                    Navigator.of(context).pushNamed(HomeScreen.routeName);
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
