import 'package:braillekeyboardgame/backend/getData.dart';
import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:flutter/material.dart';
import 'package:braillekeyboardgame/screens/homeScreen.dart';

TextStyle gtextStyle = TextStyle(color: Colors.white);

class GlobalScore extends StatefulWidget {
  static const routeName = '/globalScoreScreen';
  GlobalScore({Key key}) : super(key: key);

  @override
  _GlobalScoreState createState() => _GlobalScoreState();
}

class _GlobalScoreState extends State<GlobalScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Text(""),
      //   backgroundColor: Colors.black,
      //   title: Text("Global Score"),
      //   centerTitle: true,
      // ),
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
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: leftrightfix - iconMinus),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: iconSizeIosArrow,
                          color: Colors.white,
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
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: leftrightfix),
                    child: Text(
                      "Puntaje global",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: getScoreBoard(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        padding: EdgeInsets.all(leftrightfix),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          // snapshot.data.documents[index].data["learn"];
                          var map = snapshot.data.documents[index].data;
                          print(map);
                          return userTileForScore(
                              context: context,
                              name: map['displayName'],
                              totalScoreO: map['totalScore'],
                              proUrlo: map['photoURL'],
                              index: index);
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget userTileForScore(
    {BuildContext context,
    String name,
    String proUrlo,
    int totalScoreO,
    int index}) {
  int mainIndex = index + 1;
  return Container(
    // color: Colors.blue,
    height: 100,
    width: MediaQuery.of(context).size.width,
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "$mainIndex",
              style: gtextStyle,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 80,
              width: 80,
              child: CircleAvatar(
                minRadius: 35,
                backgroundImage: NetworkImage(proUrlo),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "$name",
              style: gtextStyle,
            ),
            // Text(
            //   "Score",
            //   style: gtextStyle,
            // ),
            Spacer(),
            Text(
              "$totalScoreO",
              style: gtextStyle,
            ),
          ],
        ),
        Spacer(),
        Container(
          height: 1,
          color: Colors.white,
        ),
      ],
    ),
  );
}
