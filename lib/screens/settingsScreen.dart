import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool soundAndEffect = false;

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settingsScreen';
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int isSound;

  TextStyle textStyle = TextStyle(color: Colors.black, fontSize: 12);

  Future<void> getSound() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      isSound = prefs.getInt('sound') ?? 1;
      if (isSound == 1) {
        soundAndEffect = true;
      } else {
        soundAndEffect = false;
      }
    });
  }

  Future<void> setSound() async {
    final SharedPreferences prefs = await _prefs;
    if (isSound == 1) {
      isSound = 0;
    } else if (isSound == 0) {
      isSound = 1;
    }
    await prefs.setInt("sound", isSound);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getSound();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Configuration",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Configyour braille app",
                style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.bold,
                ),
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
                    width: getPercentSize(70, false, context),
                    height: getPercentSize(9, true, context),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Sounds & Effests",
                          style: textStyle,
                        ),
                        Text(
                          "",
                          style: TextStyle(fontSize: 8, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Checkbox(
                    value: soundAndEffect,
                    onChanged: (value) async {
                      setSound();
                      setState(() {
                        soundAndEffect = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Container(
            //   height: getPercentSize(10, true, context),
            //   width: getPercentSize(85, false, context),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            //   alignment: Alignment.center,
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       Container(
            //         width: getPercentSize(70, false, context),
            //         height: getPercentSize(9, true, context),
            //         alignment: Alignment.center,
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             Text(
            //               "Vibrations",
            //               style: textStyle,
            //             ),
            //             Text(
            //               "This will not diable vibration on baille keyboard, only for notification",
            //               style: TextStyle(fontSize: 8, color: Colors.grey),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Checkbox(
            //         value: vibration,
            //         onChanged: (value) {
            //           setState(() {
            //             vibration = value;
            //           });
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Brailling as your keyboard",
                style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.bold,
                ),
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
                    width: getPercentSize(70, false, context),
                    height: getPercentSize(9, true, context),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Want to be our tester?",
                          style: textStyle,
                        ),
                        Text(
                          "to do",
                          style: TextStyle(fontSize: 8, color: Colors.grey),
                        ),
                      ],
                    ),
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
                    width: getPercentSize(70, false, context),
                    height: getPercentSize(9, true, context),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Donate us!",
                          style: textStyle,
                        ),
                        Text(
                          "to do",
                          style: TextStyle(fontSize: 8, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Logout Settings",
                style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.bold,
                ),
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
                    width: getPercentSize(70, false, context),
                    height: getPercentSize(9, true, context),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Disconnect your social account",
                          style: textStyle,
                        ),
                        // Text(
                        //   "to do",
                        //   style: TextStyle(fontSize: 8, color: Colors.grey),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
