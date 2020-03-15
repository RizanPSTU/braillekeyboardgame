import 'package:braillekeyboardgame/screens/loginScreen.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'braillekeyboardgame',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        //RegisterScreen.routeName: (context) => RegisterScreen(),
        // '/': (context) => RegisterScreen(),
        // LoginScreen.routeName: (context) => LoginScreen(),
      },
    );
  }
}
