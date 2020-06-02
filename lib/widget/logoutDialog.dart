import 'dart:ui';
import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/playScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:braillekeyboardgame/backend/auth.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                '¿Querés desconectar tu red social?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: headThird,
                  color: thirdHeadColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ProgressButton(
                defaultWidget: Text(
                  '¡Si! Después vuelvo',
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
                height: 80,
                color: Colors.white,
                type: ProgressButtonType.Flat,
                onPressed: () async {
                  // exit(0);
                  await setUserDataNull();
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ProgressButton(
                defaultWidget: Text(
                  "No, mantendré mi cuenta relacionadan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: headThird,
                    color: Colors.white,
                  ),
                ),
                progressWidget: CircularProgressIndicator(),
                borderRadius: 20,
                width: getPercentSize(80, false, context),
                height: 80,
                color: Colors.black,
                type: ProgressButtonType.Flat,
                onPressed: () async {
                  isPaused = false;
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
