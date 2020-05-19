import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/widget/logoutDialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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
  double leftPadding = 20;
  double leftTittlePadding = 20;

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
        child: Container(
          width: getPercentSize(100, false, context),
          child: Padding(
            padding: EdgeInsets.only(top: 0, left: leftTittlePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  // color: Colors.red,
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: getPercentSize(3, true, context),
                      bottom: getPercentSize(3, true, context),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            print("on tap");
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        // Container(
                        //   height: 50,
                        //   width: 50,
                        //   child: Image.asset('assets/bicon.png'),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: getPercentSize(100, false, context),
                  child: Text(
                    "Configuration",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: getPercentSize(100, false, context),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Configyour braille app",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
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
                            Container(
                              width: getPercentSize(70, false, context),
                              child: Padding(
                                padding: EdgeInsets.only(left: leftPadding),
                                child: Text(
                                  "Sounds & Effests",
                                  style: textStyle,
                                ),
                              ),
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
                Container(
                  width: getPercentSize(100, false, context),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Brailling as your keyboard",
                      style: TextStyle(
                        fontSize: 15, color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
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
                            Container(
                              width: getPercentSize(70, false, context),
                              child: Padding(
                                padding: EdgeInsets.only(left: leftPadding),
                                child: Text(
                                  "Want to be our tester?",
                                  style: textStyle,
                                ),
                              ),
                            ),
                            Container(
                              width: getPercentSize(70, false, context),
                              child: Padding(
                                padding: EdgeInsets.only(left: leftPadding),
                                child: Text(
                                  "TODO",
                                  style: TextStyle(
                                      fontSize: 8, color: Colors.grey),
                                ),
                              ),
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
                      GestureDetector(
                        onTap: () async {
                          const url =
                              'https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=FKYLPN59KU674&source=url';

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Container(
                          width: getPercentSize(70, false, context),
                          height: getPercentSize(9, true, context),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: getPercentSize(70, false, context),
                                child: Padding(
                                  padding: EdgeInsets.only(left: leftPadding),
                                  child: Text(
                                    "Donate us!",
                                    style: textStyle,
                                  ),
                                ),
                              ),
                              // Text(
                              //   "to do",
                              //   style: TextStyle(fontSize: 8, color: Colors.grey),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: getPercentSize(100, false, context),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Logout Settings",
                      style: TextStyle(
                        fontSize: 15, color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
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
                            GestureDetector(
                              onTap: () {
                                _showDialog() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return LogoutDialog();
                                    },
                                  );
                                }

                                _showDialog();
                              },
                              child: Container(
                                width: getPercentSize(70, false, context),
                                child: Padding(
                                  padding: EdgeInsets.only(left: leftPadding),
                                  child: Text(
                                    "Disconnect your social account",
                                    style: textStyle,
                                  ),
                                ),
                              ),
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
        ),
      ),
    );
  }
}
