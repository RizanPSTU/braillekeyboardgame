import 'dart:ui';

import 'package:braillekeyboardgame/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class BraileDialog extends StatelessWidget {
  const BraileDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: Color(0xff121212),
          child: ProgressButton(
            borderRadius: 40.9,
            animate: true,
            color: Color(0xffB70000),
            defaultWidget: const Text(
              'Exit Game?',
              style: TextStyle(color: Colors.black),
            ),
            progressWidget: const CircularProgressIndicator(),
            width: 60,
            onPressed: () async {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          )),
    );
  }
}
