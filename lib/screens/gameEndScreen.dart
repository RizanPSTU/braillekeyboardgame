import 'package:flutter/material.dart';

class GameEndScreen extends StatefulWidget {
  static const routeName = '/gameEndScreen';
  GameEndScreen({Key key}) : super(key: key);

  @override
  _GameEndScreenState createState() => _GameEndScreenState();
}

class _GameEndScreenState extends State<GameEndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("Game end"),
      ),
    );
  }
}
