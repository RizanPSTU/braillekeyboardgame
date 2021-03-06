import 'package:braillekeyboardgame/backend/auth.dart';
import 'package:braillekeyboardgame/backend/getData.dart';
import 'package:braillekeyboardgame/backend/userData.dart';
import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/globalScore.dart';
import 'package:braillekeyboardgame/screens/instructionScreen.dart';
import 'package:braillekeyboardgame/screens/morelevel.dart';
import 'package:braillekeyboardgame/screens/settingsScreen.dart';
import 'package:braillekeyboardgame/screens/usersScreen.dart';
import 'package:braillekeyboardgame/widget/exitdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:url_launcher/url_launcher.dart';

int tootalScore = 0;
int comlevel = -1;

String code = "";
int timeInt;
int pointInt;
String processM = "";
String titleM = "";
String win = "";

double leftrightfix = 20;
double top = 20;
double iconMinus = 0;

List<dynamic> globalSnapshot;
GlobalKey<ScaffoldState> drawerKey = GlobalKey();
Widget drawerWidget(
    IconData iconData, String name, double size, BuildContext context) {
  return Container(
    // color: Colors.black,
    alignment: Alignment.centerLeft,
    height: getPercentSize(13, true, context),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          iconData,
          size: size,
          color: Colors.white,
        ),
        size == 25
            ? SizedBox(
                width: 25,
              )
            : SizedBox(
                width: 20,
              ),
        Text(
          "$name",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

int indexTrack;
setNewLevel(int index) {
  indexTrack = index;
  code = globalSnapshot[index].data["code"];
  timeInt = int.parse(globalSnapshot[index].data["time"]);
  pointInt = int.parse(globalSnapshot[index].data["point"]);

  processM = globalSnapshot[index].data["process"];
  titleM = globalSnapshot[index].data["title"];
  win = globalSnapshot[index].data["win"];
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getScore().then((int onValue) {
        if (onValue == null) {
          tootalScore = 0;
        } else {
          tootalScore = onValue;
        }
      }).catchError((onError) => {print("Total get error $onError")});

      await getLevel().then((int onValue) {
        if (onValue == null) {
          comlevel = -1;
        } else {
          comlevel = onValue;
        }
      }).catchError((onError) => {print("Comlvl get error $onError")});
      setState(() {
        print("Total Score and Level $tootalScore $comlevel");
      });

      // await getCountryProfessororStudent();
    });
  }

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _showDialog() {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ExitDialog();
            },
          );
        }

        _showDialog();
      },
      child: Scaffold(
        key: drawerKey,
        drawer: Drawer(
          child: Container(
            color: Color(0xff3b3b3b),
            child: Stack(
              children: <Widget>[
                ListView(
                  padding: EdgeInsets.only(top: 50, left: 0),
                  children: <Widget>[
                    // drawerWidget(Icons.home, "Home", 30),
                    MaterialButton(
                      onPressed: () {
                        if (drawerKey.currentState.isDrawerOpen) {
                          drawerKey.currentState.openEndDrawer();
                        }
                      },
                      child: drawerWidget(Icons.home, "Inicio", 30, context),
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (drawerKey.currentState.isDrawerOpen) {
                          drawerKey.currentState.openEndDrawer();
                        }
                        Navigator.of(context).pushNamed(UserScreen.routeName);
                      },
                      child: drawerWidget(Icons.person, "Perfil", 30, context),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        if (drawerKey.currentState.isDrawerOpen) {
                          drawerKey.currentState.openEndDrawer();
                        }
                        const url =
                            'https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=FKYLPN59KU674&source=url';

                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: drawerWidget(
                          FontAwesome.heart, "¡Ayudanos!", 25, context),
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (drawerKey.currentState.isDrawerOpen) {
                          drawerKey.currentState.openEndDrawer();
                        }
                        Navigator.of(context).pushNamed(GlobalScore.routeName);
                      },
                      child: drawerWidget(
                          Icons.star, "Puntaje global", 30, context),
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (drawerKey.currentState.isDrawerOpen) {
                          drawerKey.currentState.openEndDrawer();
                        }
                        Navigator.of(context)
                            .pushNamed(SettingsScreen.routeName);
                      },
                      child: drawerWidget(
                          Icons.settings, "Configuración", 30, context),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Made with  ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          FontAwesome.heart,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 0, right: leftrightfix),
                  child: Container(
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
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Semantics(
                              button: false,
                              container: true,
                              label: "Abrir el menú",
                              // onTap: () {},
                              child: GestureDetector(
                                onTap: () {
                                  print("on tap");
                                  // _scaffoldKey.currentState.openDrawer();
                                  // Scaffold.of(context).openDrawer();
                                  if (drawerKey.currentState.isDrawerOpen) {
                                    drawerKey.currentState.openEndDrawer();
                                  } else {
                                    drawerKey.currentState.openDrawer();
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset('assets/bicon.png'),
                                ),
                              ),
                            ),
                          ),
                          Semantics(
                            button: false,
                            container: true,
                            label: "Ir a mi perfil.",
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(UserScreen.routeName);
                              },
                              child: CircleAvatar(
                                minRadius: 35,
                                backgroundImage: NetworkImage(proUrl),
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
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: leftrightfix, right: leftrightfix),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "Lista de niveles",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Puntaje actual: ",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "$tootalScore!",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                StreamBuilder(
                  stream: getDedicationNumber(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    // var  globalSnapshot = snapshot;
                    // print(snapshot.data.documents.length);
                    // print(snapshot.data.documents[0].data);
                    // {code:  , learn: Learn how to make space, id: 1, time: 15, point: 25}

                    globalSnapshot = snapshot.data.documents.toList();

                    globalSnapshot.sort((a, b) {
                      int adate = int.parse(a.data['id']);
                      int bdate = int.parse(b.data['id']);
                      return adate.compareTo(bdate);
                    });
                    return Container(
                      height: getPercentSize(65, true, context),
                      child: ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        // itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return MaterialButton(
                            onPressed: index > comlevel + 1
                                ? null
                                : () {
                                    setNewLevel(index);
                                    Navigator.of(context).pushReplacementNamed(
                                        InstructionScreen.routeName);
                                  },
                            child: level(
                              context: context,
                              learn: globalSnapshot[index].data["learn"],
                              level: globalSnapshot[index].data["id"],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 3),
                //   child: ProgressButton(
                //       defaultWidget: Text(
                //         "Desbloqueá más niveles para jugar",
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //           fontSize: headThird - 5,
                //           color: Colors.white,
                //           //fontStyle: FontStyle.italic,
                //           // fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       progressWidget: CircularProgressIndicator(),
                //       borderRadius: 20,
                //       width: getPercentSize(80, false, context),
                //       height: 60,
                //       color: Colors.pinkAccent,
                //       type: ProgressButtonType.Flat,
                //       onPressed: () async {
                //         Navigator.of(context).pushNamed(MoreLevel.routeName);
                //       }),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget level({
  BuildContext context,
  String learn,
  String level,
}) {
  // timeInt = int.parse(time);
  // pointInt = int.parse(point);
  // levelInt = int.parse(level);

  // code = "";
  // processM = "";
  // titleM = "";
  int lvl = int.parse(level);
  // print("lvl value $lvl $comlevel");

  return Padding(
    padding: EdgeInsets.only(top: 10, bottom: 10),
    child: Container(
      alignment: Alignment.centerLeft,
      // height: getPercentSize(7, true, context),
      width: getPercentSize(100, false, context),
      // color: Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            // height: getPercentSize(6, true, context),
            // child: Text(
            //   '$level   "$learn"',
            //   textAlign: TextAlign.left,
            //   style: TextStyle(
            //     fontSize: headSceonndtext,
            //     color: lvl <= comlevel ? Colors.pinkAccent : Colors.grey,
            //   ),
            // ),
            child: Container(
              width: getPercentSize(100, false, context),
              child: Text(
                '$level  $learn',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: headSceonndtext,
                  color: lvl <= comlevel + 1 ? Colors.pinkAccent : Colors.grey,
                ),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.pinkAccent,
          )
        ],
      ),
    ),
  );
}
