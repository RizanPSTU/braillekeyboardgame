import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/loginScreenFourth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LoginScreenThird extends StatefulWidget {
  static const routeName = '/loginScreeenThird';
  LoginScreenThird({Key key}) : super(key: key);

  @override
  _LoginScreenThirdState createState() => _LoginScreenThirdState();
}

class _LoginScreenThirdState extends State<LoginScreenThird> {
  double iconSizeDot = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              Navigator.of(context)
                  .pushReplacementNamed(LoginScreenFourth.routeName);
            }
          },
          child: Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: getPercentSize(40, true, context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Vas a empezar a aprender braille. ¿Arrancamos?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: headThird,
                            color: thirdHeadColor,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          '¡Si, dale!',
                          style: TextStyle(
                              fontSize: bottomText,
                              color: Colors.purple,
                              // fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreenFourth.routeName);
                      },
                      child: Text(
                        "Yes!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: headThird - 5,
                          color: thirdHeadColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FontAwesome.circle,
                          color: thirdHeadColor,
                          size: iconSizeDot,
                        ),
                        Icon(
                          FontAwesome.circle_o,
                          color: thirdHeadColor,
                          size: iconSizeDot,
                        ),
                      ],
                    ),
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
