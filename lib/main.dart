import 'package:braillekeyboardgame/screens/loginScreen.dart';
import 'package:braillekeyboardgame/screens/loginScreenSecond.dart';
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
        //'/': (context) => LoginScreen(),
        //LoginScreenSecond.routeName: (context) => LoginScreenSecond(),
        '/': (context) => LoginScreenSecond(),
      },
    );
  }
}
