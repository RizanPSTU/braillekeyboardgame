import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/playScreen.dart';
import 'package:braillekeyboardgame/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import './homeScreen.dart';

class InstructionScreen extends StatefulWidget {
  static const routeName = '/instructionScreen';
  InstructionScreen({Key key}) : super(key: key);

  @override
  _InstructionScreenState createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _showDialog() {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return BraileDialog();
            },
          );
        }

        _showDialog();
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: getPercentSize(100, false, context),
                child: Text(
                  '$titleM',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.pinkAccent,
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(
                height: getPercentSize(10, true, context),
              ),
              Container(
                width: getPercentSize(100, false, context),
                child: Text(
                  '$processM',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.purple,
                      // fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ProgressButton(
                  defaultWidget: Text(
                    'Start Playing!',
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
                        .pushReplacementNamed(PlayScreen.routeName);
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
