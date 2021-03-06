import 'dart:convert';

import 'package:braillekeyboardgame/backend/auth.dart';
import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/screens/homeScreen.dart';
import 'package:braillekeyboardgame/screens/loginScreenSecond.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List jsonAlfabete;
List jsonNumber;

loadJson() async {
  String data = await rootBundle.loadString('assets/json/keyboard.json');
  jsonAlfabete = json.decode(data);
  data = await rootBundle.loadString('assets/json/number.json');
  jsonNumber = json.decode(data);
}

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginScreeen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJson();

      getUserData().then((bool islogin) {
        if (islogin) {
          print("Home a jawar kotha");
          Navigator.of(context).pushNamed(HomeScreen.routeName);
        } else {
          print("Home a jy na kono prb ase ba new user");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding:
                EdgeInsets.only(left: leftandrightpad, right: leftandrightpad),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "¡Brailling te da la bienvenida!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: heatext,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                // Text(
                //   "BRAILLING!",
                //   style: TextStyle(
                //       fontSize: heatext,
                //       color: Colors.white,
                //       fontWeight: FontWeight.bold),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Text(
                    "Braille en tu smartphone",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: headSceonndtext,
                        color: secondHeadColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Registrate o iniciá sesión con tus redes sociales para empezar a aprender",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: headThird,
                      color: thirdHeadColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 50, bottom: 20),
                //   child: Text(
                //     "Connect using social media",
                //     style: TextStyle(
                //         fontSize: bottomText,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                LoginButton(),
                // UserProfile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  Map<String, dynamic> _profile;
  bool _loading = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.all(20),
        child: Text(
          _profile.toString(),
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ),
      Text(_loading.toString())
    ]);
  }
}

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isLoading = false;
  double size = 50;

  oldCheckAlsoNevivate(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    int oldORnew = await checkNewOrOld();
    if (oldORnew == 1) {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushNamed(HomeScreen.routeName);
    } else if (oldORnew == -1) {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushNamed(LoginScreenSecond.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Semantics(
                button: true,
                label: "Conectarse con Google",
                child: GestureDetector(
                  onTap: () async {
                    print("G te tip dise");
                    await googleSignIn();
                    oldCheckAlsoNevivate(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: hightAndWidthOfSocialButton,
                    width: hightAndWidthOfSocialButton,
                    decoration: BoxDecoration(),
                    child: Container(
                      height: size,
                      width: size,
                      child: Image.asset('assets/google.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Semantics(
                button: true,
                label: "Conectarse con Facebook",
                child: GestureDetector(
                  onTap: () async {
                    print("F te tip dise");
                    await facebookSignIn();
                    oldCheckAlsoNevivate(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: hightAndWidthOfSocialButton,
                    width: hightAndWidthOfSocialButton,
                    decoration: BoxDecoration(),
                    child: Container(
                      height: size,
                      width: size,
                      child: Image.asset('assets/facebook.png'),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
