import 'package:flutter/material.dart';
import 'package:braillekeyboardgame/widget/brailleSixDotMain.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BarilleMainSixDot(),
      ),
    );
  }
}
