import 'package:braillekeyboardgame/screens/endTutorialScreen.dart';
import 'package:braillekeyboardgame/screens/gameEndScreen.dart';
import 'package:braillekeyboardgame/screens/instructionScreen.dart';
import 'package:braillekeyboardgame/screens/loginScreen.dart';
import 'package:braillekeyboardgame/screens/loginScreenFourth.dart';
import 'package:braillekeyboardgame/screens/loginScreenSecond.dart';
import 'package:braillekeyboardgame/screens/loginScreenThird.dart';
import 'package:braillekeyboardgame/screens/homeScreen.dart';
import 'package:braillekeyboardgame/screens/playScreen.dart';
import 'package:braillekeyboardgame/screens/usersScreen.dart';
import 'package:braillekeyboardgame/screens/tutorialScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        // primaryColor: Color(0xff292929),
        // brightness: Brightness.dark,
        // accentColor: commonProGreenKhalka,
        scaffoldBackgroundColor: Colors.black54,
        hintColor: Colors.white,
        textTheme: TextTheme(
          headline: TextStyle(color: Colors.white),
          title: TextStyle(color: Colors.white),
          body1: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'BrailleGame',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        LoginScreenSecond.routeName: (context) => LoginScreenSecond(),
        LoginScreenThird.routeName: (context) => LoginScreenThird(),
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreenFourth.routeName: (context) => LoginScreenFourth(),
        TutorialScreen.routeName: (context) => TutorialScreen(),
        EndTutorialScreen.routeName: (context) => EndTutorialScreen(),
        InstructionScreen.routeName: (context) => InstructionScreen(),
        GameEndScreen.routeName: (context) => GameEndScreen(),
        PlayScreen.routeName: (context) => PlayScreen(),
        UserScreen.routeName: (context) => UserScreen(),
        // '/': (context) => LoginScreenSecond(),
        // LoginScreenSecond.routeName: (context) => LoginScreenSecond(),
        // '/': (context) => HomeScreen(),
      },
    );
  }
}
