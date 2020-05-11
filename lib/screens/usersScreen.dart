import 'package:braillekeyboardgame/backend/auth.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/widget/CountryToggle.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';

bool isChecked = false;
double sizedBoxHight = 20;
double whiteBoxLeftPAdding = 10;

class UserScreen extends StatefulWidget {
  static const routeName = '/usersScreen';
  UserScreen({Key key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextStyle textStyle = TextStyle(color: Colors.black, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: leftrightfix - iconMinus,
                            right: leftrightfix),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 50,
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
            Container(
              height: 100,
              width: 100,
              child: CircleAvatar(
                minRadius: 35,
                backgroundImage: NetworkImage(proUrl),
              ),
            ),
            SizedBox(
              height: sizedBoxHight,
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
                "Your actual score is: $tootalScore!",
                style: TextStyle(fontSize: 15, color: Colors.white
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
              child: Padding(
                padding: EdgeInsets.only(left: whiteBoxLeftPAdding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Braille Knowlege in",
                      style: textStyle,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: ToggleButton(),
                    ),
                  ],
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
