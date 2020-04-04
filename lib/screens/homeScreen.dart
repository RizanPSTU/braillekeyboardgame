import 'package:braillekeyboardgame/backend/auth.dart';
import 'package:braillekeyboardgame/backend/getData.dart';
import 'package:braillekeyboardgame/backend/userData.dart';
import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:flutter/material.dart';

int tootalScore = 0;
int comlevel = 0;
String code = "";
int timeInt;
int pointInt;
int levelInt;
String processM = "";
String titleM = "";

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
        if (onValue >= 1) {
          tootalScore = onValue;
        }
      });

      getLevel().then((int onValue) {
        if (onValue >= 1) {
          comlevel = onValue;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: BarilleMainSixDot(),
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
                    Container(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/bicon.png'),
                    ),
                    CircleAvatar(
                      minRadius: 35,
                      backgroundImage: NetworkImage(proUrl),
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
                )),
            StreamBuilder(
              stream: getDedicationNumber(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // print(snapshot.data.documents.length);
                // print(snapshot.data.documents[0].data);
                // {code:  , learn: Learn how to make space, id: 1, time: 15, point: 25}
                return Container(
                  height: getPercentSize(70, true, context),
                  child: ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MaterialButton(
                        onPressed: () {
                          print("teststset");
                        },
                        child: level(
                          context: context,
                          learn: snapshot.data.documents[index].data["learn"],
                          level: snapshot.data.documents[index].data["id"],
                          point: snapshot.data.documents[index].data["point"],
                          time: snapshot.data.documents[index].data["time"],
                          code: snapshot.data.documents[index].data["code"],
                          process:
                              snapshot.data.documents[index].data["process"],
                          title: snapshot.data.documents[index].data["title"],
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
  String point,
  String time,
  String code,
  String process,
  String title,
}) {
  timeInt = int.parse(time);
  pointInt = int.parse(point);
  levelInt = int.parse(level);

  code = "";
  processM = "";
  titleM = "";

  return Container(
    alignment: Alignment.centerLeft,
    height: getPercentSize(6, true, context),
    width: getPercentSize(100, false, context),
    // color: Colors.purple,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: getPercentSize(100, false, context),
          // height: getPercentSize(70, true, context),
          child: Text(
            '$level   "$learn"',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: headSceonndtext,
              color: levelInt <= comlevel ? Colors.pinkAccent : Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 1,
          color: Colors.pinkAccent,
        )
      ],
    ),
  );
}
