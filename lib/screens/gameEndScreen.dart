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
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("${args["msg"]}"),
        ),
      ),
    );
  }
}
