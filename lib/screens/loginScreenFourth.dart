import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/tutorialScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class LoginScreenFourth extends StatefulWidget {
  static const routeName = '/loginScreeenFourth';
  LoginScreenFourth({Key key}) : super(key: key);

  @override
  _LoginScreenFourthState createState() => _LoginScreenFourthState();
}

class _LoginScreenFourthState extends State<LoginScreenFourth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.only(top: 50, bottom: 20),
              //   child: Text(
              //     "START LEARNING FOR FREE",
              //     style: TextStyle(
              //         fontSize: headSceonndtext,
              //         color: secondHeadColor,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                    left: leftandrightpad, right: leftandrightpad),
                child: Text(
                  'En la siguiente pantalla hay seis puntos: tres en una columna y tres en la otra. Numeraremos los puntos de arriba a abajo, primero con la primera columna y luego con la segunda. Entonces, el tercer punto sería el último de la primera columna. El cuarto punto sería el primero de la segunda columna.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: headThird,
                    color: thirdHeadColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: leftandrightpad,
                    right: leftandrightpad,
                    top: 5,
                    bottom: 5),
                child: Text(
                  'Vamos a aprender a usar el teclado. Vas a tener que tocar la pantalla con dos dedos, sin levantarlos, para sentir las vibraciones, que marcan la ubicación de los puntos del braille. Entre cada punto, los espacios no vibran.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: bottomText,
                      color: Colors.purple,
                      // fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: ProgressButton(
                  defaultWidget: Text(
                    'Empezar el tutorial',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: headThird,
                      color: Colors.black,
                      //fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  progressWidget: CircularProgressIndicator(),
                  borderRadius: 20,
                  width: getPercentSize(80, false, context),
                  height: 60,
                  color: Colors.white,
                  type: ProgressButtonType.Flat,
                  onPressed: () async {
                    Navigator.of(context)
                        .pushReplacementNamed(TutorialScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
