import 'package:braillekeyboardgame/backend/auth.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:flutter/material.dart';

import 'homeScreen.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/usersScreen';
  UserScreen({Key key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              child: CircleAvatar(
                minRadius: 35,
                backgroundImage: NetworkImage(proUrl),
              ),
            ),
            Text(
              "$name",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Your actual score is:$tootalScore!",
                style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: getPercentSize(10, true, context),
              width: getPercentSize(85, false, context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(""),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: getPercentSize(10, true, context),
              width: getPercentSize(85, false, context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(""),
            )
          ],
        ),
      ),
    );
  }
}
