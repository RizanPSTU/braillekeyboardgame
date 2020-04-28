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
  TextStyle textStyle = TextStyle(color: Colors.black, fontSize: 12);
  bool isChecked = false;
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
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    "Braille Knowlege in",
                    style: textStyle,
                  ),
                  Container(
                    height: 20,
                    width: 40,
                    child: Image.asset('icons/flags/png/es.png',
                        package: 'country_icons'),
                  ),
                  Container(
                    height: 20,
                    width: 40,
                    child: Image.asset('icons/flags/png/ar.png',
                        package: 'country_icons'),
                  ),
                ],
              ),
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
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    // color: Colors.red,
                    width: getPercentSize(70, false, context),
                    height: getPercentSize(9, true, context),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Are you a student or proffesor ?",
                          style: textStyle,
                        ),
                        Text(
                          "If you click yes, you will ake to be verified and have promotional codes in future?",
                          style: TextStyle(fontSize: 8, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
