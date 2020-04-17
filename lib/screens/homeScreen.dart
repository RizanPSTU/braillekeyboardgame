import 'package:braillekeyboardgame/backend/auth.dart';
import 'package:braillekeyboardgame/backend/getData.dart';
import 'package:braillekeyboardgame/backend/userData.dart';
import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/instructionScreen.dart';
import 'package:braillekeyboardgame/screens/usersScreen.dart';
import 'package:braillekeyboardgame/widget/marquee.dart';
import 'package:flutter/material.dart';

int tootalScore = 0;
int comlevel = 0;

String code = "";
int timeInt;
int pointInt;
String processM = "";
String titleM = "";
String win = "";

var globalSnapshot;

int indexTrack;
setNewLevel(int index) {
  indexTrack = index;
  code = globalSnapshot.data.documents[index].data["code"];
  timeInt = int.parse(globalSnapshot.data.documents[index].data["time"]);
  pointInt = int.parse(globalSnapshot.data.documents[index].data["point"]);

  processM = globalSnapshot.data.documents[index].data["process"];
  titleM = globalSnapshot.data.documents[index].data["title"];
  win = globalSnapshot.data.documents[index].data["win"];
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
      getScore().then((int onValue) {
        if (onValue == null) {
          tootalScore = 0;
        } else if (onValue >= 1) {
          tootalScore = onValue;
        }
      });

      getLevel().then((int onValue) {
        if (onValue == null) {
          comlevel = 0;
        } else if (onValue >= 1) {
          comlevel = onValue;
        }
      });
    });
  }

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      // key: _scaffoldKey,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      // ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey,
          child: Stack(
            children: <Widget>[
              ListView(
                padding: EdgeInsets.only(top: 50),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ListTile(
                  //   title: Text('Item 4'),
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  // ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Made with ♥'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
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
                    GestureDetector(
                      onTap: () {
                        print("on tap");
                        // _scaffoldKey.currentState.openDrawer();
                        // Scaffold.of(context).openDrawer();
                        if (_drawerKey.currentState.isDrawerOpen) {
                          _drawerKey.currentState.openEndDrawer();
                        } else {
                          _drawerKey.currentState.openDrawer();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/bicon.png'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(UserScreen.routeName);
                      },
                      child: CircleAvatar(
                        minRadius: 35,
                        backgroundImage: NetworkImage(proUrl),
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
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Learning Braille!",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Your actual score is:$tootalScore!",
                      style: TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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
                globalSnapshot = snapshot;
                // print(snapshot.data.documents.length);
                // print(snapshot.data.documents[0].data);
                // {code:  , learn: Learn how to make space, id: 1, time: 15, point: 25}
                return Container(
                  height: getPercentSize(50, true, context),
                  child: ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MaterialButton(
                        onPressed: () {
                          setNewLevel(index);
                          Navigator.of(context)
                              .pushNamed(InstructionScreen.routeName);
                        },
                        child: level(
                          context: context,
                          learn: snapshot.data.documents[index].data["learn"],
                          level: snapshot.data.documents[index].data["id"],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
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

  return Container(
    alignment: Alignment.centerLeft,
    height: getPercentSize(7, true, context),
    width: getPercentSize(100, false, context),
    // color: Colors.purple,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: getPercentSize(6, true, context),
          // child: Text(
          //   '$level   "$learn"',
          //   textAlign: TextAlign.left,
          //   style: TextStyle(
          //     fontSize: headSceonndtext,
          //     color: lvl <= comlevel ? Colors.pinkAccent : Colors.grey,
          //   ),
          // ),
          child: MarqueeWidget(
            child: Text(
              '$level   "$learn"',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: headSceonndtext,
                color: lvl <= comlevel ? Colors.pinkAccent : Colors.grey,
              ),
            ),
            direction: Axis.vertical,
            animationDuration: Duration(microseconds: 0),
            backDuration: Duration(microseconds: 0),
            pauseDuration: Duration(microseconds: 0),
          ),
        ),
        Container(
          height: 1,
          color: Colors.pinkAccent,
        )
      ],
    ),
  );
}
