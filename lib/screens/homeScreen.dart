import 'package:braillekeyboardgame/backend/getData.dart';
import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get heatext => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: BarilleMainSixDot(),
        child: Column(
          children: <Widget>[
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
                      return level(
                          context: context,
                          learn: snapshot.data.documents[index].data["learn"],
                          level: snapshot.data.documents[index].data["id"],
                          done: "1",
                          point: snapshot.data.documents[index].data["point"],
                          time: snapshot.data.documents[index].data["time"],
                          code: snapshot.data.documents[index].data["code"]);
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

Widget level(
    {BuildContext context,
    String learn,
    String level,
    String done,
    String point,
    String time,
    String code}) {
  int timeInt = int.parse(time);
  int pointInt = int.parse(point);
  int doneInt = int.parse(done);
  int levelInt = int.parse(level);

  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: GestureDetector(
      onTap: () {},
      child: Container(
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
                  color: levelInt <= doneInt ? Colors.pinkAccent : Colors.grey,
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
      ),
    ),
  );
}
