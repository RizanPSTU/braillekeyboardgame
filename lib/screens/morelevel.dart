import 'package:braillekeyboardgame/backend/getData.dart';
import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/homeScreen.dart';
import 'package:braillekeyboardgame/screens/instructionScreen.dart';
import 'package:flutter/material.dart';

class MoreLevel extends StatefulWidget {
  static const routeName = '/moreLevelScreen';
  MoreLevel({Key key}) : super(key: key);

  @override
  _MoreLevelState createState() => _MoreLevelState();
}

class _MoreLevelState extends State<MoreLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: Semantics(
                        button: true,
                        label: "Volver a la pantalla anterior",
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: leftrightfix - iconMinus,
                              right: leftrightfix),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: iconSizeIosArrow,
                            color: Colors.white,
                          ),
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
            Padding(
              padding: EdgeInsets.only(left: leftrightfix, right: leftrightfix),
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
            Expanded(
              child: StreamBuilder(
                stream: getDedicationNumber(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  globalSnapshot = snapshot.data.documents.toList();

                  globalSnapshot.sort((a, b) {
                    int adate = int.parse(a.data['id']);
                    int bdate = int.parse(b.data['id']);
                    return adate.compareTo(bdate);
                  });
                  // print(snapshot.data.documents.length);
                  // print(snapshot.data.documents[0].data);
                  // {code:  , learn: Learn how to make space, id: 1, time: 15, point: 25}
                  return Container(
                    // height: getPercentSize(50, true, context),
                    child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      // itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return MaterialButton(
                          onPressed: () {
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
            ),
          ],
        ),
      ),
    );
  }
}
