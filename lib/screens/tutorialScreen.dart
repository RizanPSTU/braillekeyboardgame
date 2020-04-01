import 'package:braillekeyboardgame/widget/brailleTutorial.dart';
import 'package:flutter/material.dart';

class TutorialScreen extends StatefulWidget {
  static const routeName = '/tutorialScreen';
  TutorialScreen({Key key}) : super(key: key);

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BarilleMainSixDotTutorial(),
        // child: Text("data"),
      ),
    );
  }
}
