import 'package:braillekeyboardgame/backend/auth.dart';
import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/widget/CountryToggle.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isChecked = false;
double sizedBoxHight = 20;
double whiteBoxLeftPAdding = 10;

double userdetails2hiteBox = 20;

class UserScreen extends StatefulWidget {
  static const routeName = '/usersScreen';
  UserScreen({Key key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextStyle textStyle = TextStyle(color: Colors.black, fontSize: 12);
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setCheck(bool isCheckedArg) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool("isCheckedpro", isCheckedArg);
  }

  Future<void> getCheck() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      isChecked = prefs.getBool('isCheckedpro') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getCheck();
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
            Container(
              // color: Colors.red,
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: getPercentSize(3, true, context),
                  bottom: getPercentSize(9, true, context),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        print("on tap");
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: leftrightfix - iconMinus,
                            right: leftrightfix),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: iconSizeIosArrow,
                          color: Colors.white,
                        ),
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
            Padding(
              padding: EdgeInsets.only(left: userdetails2hiteBox),
              child: Container(
                width: getPercentSize(100, false, context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Semantics(
                      button: true,
                      label: "Profile Image",
                      child: Container(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          minRadius: 35,
                          backgroundImage: NetworkImage(proUrl),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizedBoxHight + 20,
                    ),
                    Text(
                      "$name",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Puntaje actual: ",
                          style: TextStyle(fontSize: 15, color: Colors.white
                              // fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          "$tootalScore!",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizedBoxHight + 20,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: userdetails2hiteBox - 5),
              child: Container(
                height: getPercentSize(10, true, context),
                width: getPercentSize(85, false, context),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: whiteBoxLeftPAdding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Aprender braille en idioma",
                        style: textStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 25.0),
                        child: ToggleButton(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: userdetails2hiteBox - 5),
              child: Container(
                height: getPercentSize(10, true, context),
                width: getPercentSize(85, false, context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: whiteBoxLeftPAdding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        // color: Colors.red,
                        width: getPercentSize(65, false, context),
                        height: getPercentSize(9, true, context),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "¿Estudiás Accesibilidad o sos profe",
                              style: textStyle,
                            ),
                            Text(
                              "Al tildar la casilla de verificación, podrías tener beneficios en el futuro.",
                              style: TextStyle(fontSize: 8, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (value) async {
                            await setCheck(value);
                            setState(() {
                              isChecked = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: ProgressButton(
            //     defaultWidget: Text(
            //       "Save",
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         fontSize: headThird,
            //         color: Colors.white,
            //       ),
            //     ),
            //     progressWidget: CircularProgressIndicator(),
            //     borderRadius: 20,
            //     width: getPercentSize(80, false, context),
            //     height: 80,
            //     color: Colors.black,
            //     type: ProgressButtonType.Flat,
            //     onPressed: () async {
            //       await saveCountryAndProfessirOrStudet(country, isChecked);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
