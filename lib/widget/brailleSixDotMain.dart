import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';

AudioCache player = AudioCache(prefix: 'audio/');

playsound() {
  player.play('pop.mp3');
  HapticFeedback.vibrate();
}

class BarilleMainSixDot extends StatefulWidget {
  BarilleMainSixDot({Key key}) : super(key: key);

  @override
  _BarilleMainSixDotState createState() => _BarilleMainSixDotState();
}

class _BarilleMainSixDotState extends State<BarilleMainSixDot> {
  List<int> values = new List();
  String valuesSee;
  GlobalKey _key1 = GlobalKey();
  GlobalKey _key2 = GlobalKey();
  GlobalKey _key3 = GlobalKey();
  GlobalKey _key4 = GlobalKey();
  GlobalKey _key5 = GlobalKey();
  GlobalKey _key6 = GlobalKey();
  bool booldot1 = false;
  bool booldot2 = false;
  bool booldot3 = false;
  bool booldot4 = false;
  bool booldot5 = false;
  bool booldot6 = false;
  GlobalKey _fullContainer = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    double sizeOfDot = 150;
    double sizeOfDotSpace = 50;
    double sizeOfDotHightSpace = 50;
    Widget barilleDot(GlobalKey key, bool isActive) {
      return Container(
        height: sizeOfDot,
        width: sizeOfDot,
        child: Container(
          key: key,
          decoration: BoxDecoration(
            color: isActive == true ? Colors.orange : Colors.green,
            shape: BoxShape.circle,
          ),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Listener(
              onPointerMove: (PointerEvent details) async {
                final RenderBox dot1 = _key1.currentContext.findRenderObject();
                final RenderBox dot2 = _key2.currentContext.findRenderObject();
                final RenderBox dot3 = _key3.currentContext.findRenderObject();
                final RenderBox dot4 = _key4.currentContext.findRenderObject();
                final RenderBox dot5 = _key5.currentContext.findRenderObject();
                final RenderBox dot6 = _key6.currentContext.findRenderObject();
                final result = BoxHitTestResult();
                Offset localDot1 = dot1.globalToLocal(details.position);
                Offset localDot2 = dot2.globalToLocal(details.position);
                Offset localDot3 = dot3.globalToLocal(details.position);
                Offset localDot4 = dot4.globalToLocal(details.position);
                Offset localDot5 = dot5.globalToLocal(details.position);
                Offset localDot6 = dot6.globalToLocal(details.position);
                if (dot1.hitTest(result, position: localDot1)) {
                  if (!values.contains(1)) {
                    values.add(1);
                  }
                  if (!booldot1) {
                    playsound();
                  }
                  booldot1 = true;
                  // print("Do1");
                } else if (dot2.hitTest(result, position: localDot2)) {
                  if (!values.contains(2)) {
                    values.add(2);
                  }
                  if (!booldot2) {
                    playsound();
                  }
                  booldot2 = true;
                  // print("Dot2");
                } else if (dot3.hitTest(result, position: localDot3)) {
                  if (!values.contains(3)) {
                    values.add(3);
                  }
                  if (!booldot3) {
                    playsound();
                  }
                  booldot3 = true;
                  // print("Dot3");
                } else if (dot4.hitTest(result, position: localDot4)) {
                  if (!values.contains(4)) {
                    values.add(4);
                  }
                  if (!booldot4) {
                    playsound();
                  }
                  booldot4 = true;
                  // print("Dot4");
                } else if (dot5.hitTest(result, position: localDot5)) {
                  if (!values.contains(5)) {
                    values.add(5);
                  }
                  if (!booldot5) {
                    playsound();
                  }
                  booldot5 = true;
                  // print("Dot5");
                } else if (dot6.hitTest(result, position: localDot6)) {
                  if (!values.contains(6)) {
                    values.add(6);
                  }
                  if (!booldot6) {
                    playsound();
                  }
                  booldot6 = true;
                  // print("Dot6");
                }
                setState(() {});
              },
              onPointerUp: (PointerUpEvent details) {
                print("Pointer UP local ${details.localPosition}");
                print("Pointer UP poistion ${details.position}");
                booldot1 = false;
                booldot2 = false;
                booldot3 = false;
                booldot4 = false;
                booldot5 = false;
                booldot6 = false;
                valuesSee = values.toString();
                values.clear();
                setState(() {});
              },
              child: Container(
                key: _fullContainer,
                color: Colors.blue,
                height: MediaQuery.of(context).size.height -
                    getPercentSize(10, true, context),
                width: MediaQuery.of(context).size.width -
                    getPercentSize(10, false, context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          barilleDot(_key1, booldot1),
                          SizedBox(
                            width: sizeOfDotSpace,
                          ),
                          barilleDot(_key4, booldot4),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sizeOfDotHightSpace,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          barilleDot(_key2, booldot2),
                          SizedBox(
                            width: sizeOfDotSpace,
                          ),
                          barilleDot(_key5, booldot5),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sizeOfDotHightSpace,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          barilleDot(_key3, booldot3),
                          SizedBox(
                            width: sizeOfDotSpace,
                          ),
                          barilleDot(_key6, booldot6),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sizeOfDotHightSpace - 20,
                    ),
                    Container(
                      child: Text(
                        "$valuesSee",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
