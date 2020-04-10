import 'dart:convert';

import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/screens/homeScreen.dart';
import 'package:braillekeyboardgame/screens/loginScreenSecond.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:braillekeyboardgame/backend/auth.dart';

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

      checkOldToNew().then((int onValue) {
        if (onValue == 1) {
          print("Home a jawar kotha");
          Navigator.of(context).pushNamed(HomeScreen.routeName);
        } else {
          print("Home a jy na kono prb ase ");
          authService.signOut();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "WELCOME",
                style: TextStyle(
                    fontSize: heatext,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "BRAILLING!",
                style: TextStyle(
                    fontSize: heatext,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Text(
                  "BRAILLE ON YOUR PHONE",
                  style: TextStyle(
                      fontSize: headSceonndtext,
                      color: secondHeadColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "We need you to signup with any of these social accounts to start learning!",
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
                  "Connect using social media",
                  style: TextStyle(
                      fontSize: bottomText,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Container(
                  //   alignment: Alignment.center,
                  //   height: hightAndWidthOfSocialButton,
                  //   width: hightAndWidthOfSocialButton,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.blue, width: 1),
                  //     borderRadius: BorderRadius.circular(3),
                  //   ),
                  //   child: Icon(
                  //     FontAwesome.facebook,
                  //     color: Colors.blue,
                  //     size: iconSize,
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 20,
                  // ),
                  GestureDetector(
                    onTap: () async {
                      print("G te tip dise");
                      int oldOrNew = await checkOldToNew();
                      print("old or new check ===>$oldOrNew");
                      Navigator.of(context)
                          .pushNamed(LoginScreenSecond.routeName);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: hightAndWidthOfSocialButton,
                      width: hightAndWidthOfSocialButton,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.red, width: 1),
                          // borderRadius: BorderRadius.circular(3),
                          ),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/google.png'),
                      ),
                    ),
                  ),

                  // StreamBuilder(
                  //     stream: authService.user,
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         return MaterialButton(
                  //           onPressed: () => authService.signOut(),
                  //           color: Colors.red,
                  //           textColor: Colors.white,
                  //           child: Text('Signout'),
                  //         );
                  //       } else {
                  //         return GestureDetector(
                  //           onTap: () async {
                  //             // print("G te tip dise");
                  //             // authService.googleSignIn();
                  //             int oldOrNew = await checkOldToNew();
                  //             print("old or new check ===>$oldOrNew");
                  //             Navigator.of(context)
                  //                 .pushNamed(HomeScreen.routeName);
                  //             // if (oldOrNew == 1) {
                  //             //   print("1");
                  //             //   Navigator.of(context)
                  //             //       .pushNamed(HomeScreen.routeName);
                  //             // } else if (oldOrNew == 0) {
                  //             //   print("0");
                  //             //   Navigator.of(context)
                  //             //       .pushNamed(LoginScreenSecond.routeName);
                  //             // } else {
                  //             //   print("Something is wrong");
                  //             // }
                  //           },
                  //           child: Container(
                  //             alignment: Alignment.center,
                  //             height: hightAndWidthOfSocialButton,
                  //             width: hightAndWidthOfSocialButton,
                  //             decoration: BoxDecoration(
                  //                 // border: Border.all(color: Colors.red, width: 1),
                  //                 // borderRadius: BorderRadius.circular(3),
                  //                 ),
                  //             child: Container(
                  //               height: 50,
                  //               width: 50,
                  //               child: Image.asset('assets/google.png'),
                  //             ),
                  //           ),
                  //         );
                  //       }
                  //     }),
                ],
              ),
              LoginButton(),
              UserProfile(),
            ],
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
    // Subscriptions are created here
    authService.profile.listen((state) => setState(() => _profile = state));
    authService.loading.listen((state) => setState(() => _loading = state));
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

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authService.user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialButton(
              onPressed: () => authService.signOut(),
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Signout'),
            );
          } else {
            return MaterialButton(
              onPressed: () => authService.googleSignIn(),
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Login with Google'),
            );
          }
        });
  }
}
