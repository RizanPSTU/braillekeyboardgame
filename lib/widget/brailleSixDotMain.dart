import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/loginScreen.dart';
import 'package:braillekeyboardgame/screens/playScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';

AudioCache player = AudioCache(prefix: 'audio/');
bool isNumberActive = false;

bool isWon = false;

String mainCode = "i_am_a_good_boy";
String vulDhora = "";
String wrongWrite = "";
String corerctWrite = "";
bool isPressed = false;
int currentPos = -1;
int mainCurrentPos = 0;

playsound() async {
  player.play('pop.mp3');
  HapticFeedback.vibrate();
}

String cheackWhatPressedAndWhatShouldBePressed(String dotCombination) {
  bool isContain = false;
  String comb;
  String char;
  if (isNumberActive) {
    for (int i = 0; i < jsonNumber.length; i++) {
      var test = jsonNumber[i];
      comb = test["Combination"][0];
      char = test["Char"];
      if (dotCombination.length == comb.length) {
        for (int j = 0; j < comb.length; j++) {
          if (comb.contains(dotCombination[j])) {
            isContain = true;
          } else {
            isContain = false;
            break;
          }
        }
      }
      if (isContain) {
        break;
      }
    }
  } else {
    for (int i = 0; i < jsonAlfabete.length; i++) {
      var test = jsonAlfabete[i];
      comb = test["Combination"][0];
      char = test["Char"];
      if (dotCombination.length == comb.length) {
        for (int j = 0; j < comb.length; j++) {
          if (comb.contains(dotCombination[j])) {
            isContain = true;
          } else {
            isContain = false;
            break;
          }
        }
      }
      if (isContain) {
        break;
      }
    }
  }
  // print(char);
  if (isContain && char == "N" && isNumberActive == false) {
    isNumberActive = true;
  } else if (isContain && char == "N" && isNumberActive == true) {
    isNumberActive = false;
  }

  return isContain ? char : "U";
}

String removeListDebree(String value) {
  value = value.replaceAll(',', '');
  value = value.replaceAll('[', '');
  value = value.replaceAll(' ', '');
  value = value.replaceAll(']', '');
  return value;
}

class BarilleMainSixDot extends StatefulWidget {
  BarilleMainSixDot({Key key}) : super(key: key);

  @override
  _BarilleMainSixDotState createState() => _BarilleMainSixDotState();
}

class _BarilleMainSixDotState extends State<BarilleMainSixDot> {
  List<int> values = new List();
  // String valuesSee = "";
  String valuesPass = "";
  String charPress = "";
  int count = 0;
  bool isOff = false;
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
  bool isright = false;
  bool isLeft = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizeOfDot = 120;
    double sizeOfDotSpace = 120;
    double sizeOfDotHightSpace = 120;
    int rightC = 0;
    int leftC = 0;

    Drag _handleOnStart(Offset position) {
      void _handleDragUpdate(DragUpdateDetails update) {
        if (update.delta.dx > 0) {
          // print("swipe right");
          rightC++;
        } else {
          // print("swipe left");
          leftC++;
        }
      }

      void _handleDragEnd(DragEndDetails details) {
        count = 0;
        if (isOff) {
          print("_handleDragEnd => ${details.velocity.pixelsPerSecond.dx}");
          if (rightC > leftC && details.velocity.pixelsPerSecond.dx > 150) {
            print("Right Swipe");
            isright = true;
            isLeft = false;
          } else if (rightC < leftC &&
              details.velocity.pixelsPerSecond.dx < -150) {
            print("Left Swipe");
            isLeft = true;
            isright = false;
          }
          isOff = false;
        }
        rightC = 0;
        leftC = 0;
      }

      if (count < 1) {
        setState(() {
          count++;
          print(count);
        });
        return _DragHandler(_handleDragUpdate, _handleDragEnd);
      } else {
        isOff = true;
        return null;
      }
    }

    Widget barilleDot(GlobalKey key, bool isActive) {
      return Container(
        height: sizeOfDot,
        width: sizeOfDot,
        child: Container(
          key: key,
          decoration: BoxDecoration(
            color: isActive == true ? thirdHeadColor : Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      );
    }

    if (jsonAlfabete != null && valuesPass.length > 0 && jsonNumber != null) {
      charPress = cheackWhatPressedAndWhatShouldBePressed(valuesPass);
      valuesPass = "";
      isPressed = true;
    }
    if (isright) {
      charPress = "_";
      // print("ts");
      isPressed = true;
      isright = false;
    } else if (isLeft) {
      charPress = "D";
      // print("td");
      isPressed = true;
      isLeft = false;
    }
    if (!isTimeFinished) {
      if (!isWon) {
        if (isPressed) {
          if (charPress != "D" && charPress != "N") {
            if (charPress != "U") {
              wrongWrite = wrongWrite + charPress;
              currentPos++;
              if (currentPos == mainCurrentPos) {
                if (mainCode[mainCurrentPos] == wrongWrite[currentPos]) {
                  mainCurrentPos++;
                  // currentPos++;
                  vulDhora = "";
                } else {
                  if (mainCode[mainCurrentPos] == "_") {
                    vulDhora =
                        "Wring: Should be Space not ${wrongWrite[currentPos]}";
                  } else {
                    vulDhora =
                        "Wring: Should be ${mainCode[mainCurrentPos]} not ${wrongWrite[currentPos]}";
                  }
                }
              } else {
                vulDhora = "Wring: Remove extra charecter";
              }
            } else {
              vulDhora = "Wring: Unknown Barille :3";
            }
          }

          if (charPress == "N") {
            if (isNumberActive) {
              vulDhora = "Number mode activated";
            } else {
              vulDhora = "Number mode deactivated";
            }
          }

          if (charPress == "D") {
            if (currentPos >= mainCurrentPos) {
              if (wrongWrite.length > 1) {
                wrongWrite = wrongWrite.substring(0, wrongWrite.length - 1);
                currentPos--;
              } else if (wrongWrite.length == 1) {
                wrongWrite = "";
                currentPos--;
              } else if (wrongWrite.length == 0) {
                vulDhora = "Wrong: Nothing to remove";
              }
            } else if (currentPos == 0) {
              wrongWrite = "";
              currentPos = -1;
            } else if (currentPos == -1) {
              vulDhora = "Wrong: Nothing to remove";
            } else {
              vulDhora = "Wrong: Already got right no need to delete";
            }
          }

          isPressed = false;
          charPress = "";
          // print("Write ===>$write");
          print("is pr ===>$currentPos");
        }
      } else {
        wrongWrite = "";
        vulDhora = "you won :3 yhaaa :3";
      }
    } else {
      wrongWrite = "";
      vulDhora = "time finished :3 sorry try again :3";
    }

    if (mainCurrentPos == mainCode.length) {
      isWon = true;
      print("You won yhaaaaaa");
    }
    return RawGestureDetector(
      gestures: {
        HorizontalMultiDragGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<
                HorizontalMultiDragGestureRecognizer>(
          () => HorizontalMultiDragGestureRecognizer(),
          (HorizontalMultiDragGestureRecognizer instance) {
            instance..onStart = _handleOnStart;
          },
        )
      },
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: getPercentSize(100, true, context),
            width: getPercentSize(100, false, context),
            color: Colors.black,
            child: Center(
              child: isOff
                  ? Container(
                      height: getPercentSize(100, true, context),
                      width: getPercentSize(100, false, context),
                      color: Colors.black,
                    )
                  : Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Listener(
                            onPointerMove: (PointerEvent details) {
                              try {
                                final RenderBox dot1 =
                                    _key1.currentContext.findRenderObject();
                                final RenderBox dot2 =
                                    _key2.currentContext.findRenderObject();
                                final RenderBox dot3 =
                                    _key3.currentContext.findRenderObject();
                                final RenderBox dot4 =
                                    _key4.currentContext.findRenderObject();
                                final RenderBox dot5 =
                                    _key5.currentContext.findRenderObject();
                                final RenderBox dot6 =
                                    _key6.currentContext.findRenderObject();
                                final result = BoxHitTestResult();
                                Offset localDot1 =
                                    dot1.globalToLocal(details.position);
                                Offset localDot2 =
                                    dot2.globalToLocal(details.position);
                                Offset localDot3 =
                                    dot3.globalToLocal(details.position);
                                Offset localDot4 =
                                    dot4.globalToLocal(details.position);
                                Offset localDot5 =
                                    dot5.globalToLocal(details.position);
                                Offset localDot6 =
                                    dot6.globalToLocal(details.position);
                                if (dot1.hitTest(result, position: localDot1)) {
                                  if (!values.contains(1)) {
                                    values.add(1);
                                  }
                                  if (!booldot1) {
                                    playsound();
                                  }
                                  booldot1 = true;
                                  // print("Do1");
                                } else if (dot2.hitTest(result,
                                    position: localDot2)) {
                                  if (!values.contains(2)) {
                                    values.add(2);
                                  }
                                  if (!booldot2) {
                                    playsound();
                                  }
                                  booldot2 = true;
                                  // print("Dot2");
                                } else if (dot3.hitTest(result,
                                    position: localDot3)) {
                                  if (!values.contains(3)) {
                                    values.add(3);
                                  }
                                  if (!booldot3) {
                                    playsound();
                                  }
                                  booldot3 = true;
                                  // print("Dot3");
                                } else if (dot4.hitTest(result,
                                    position: localDot4)) {
                                  if (!values.contains(4)) {
                                    values.add(4);
                                  }
                                  if (!booldot4) {
                                    playsound();
                                  }
                                  booldot4 = true;
                                  // print("Dot4");
                                } else if (dot5.hitTest(result,
                                    position: localDot5)) {
                                  if (!values.contains(5)) {
                                    values.add(5);
                                  }
                                  if (!booldot5) {
                                    playsound();
                                  }
                                  booldot5 = true;
                                  // print("Dot5");
                                } else if (dot6.hitTest(result,
                                    position: localDot6)) {
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
                              } catch (e) {
                                // print("find box error => ");
                              }
                            },
                            onPointerUp: (PointerUpEvent details) {
                              // print("Pointer UP local ${details.localPosition}");
                              // print("Pointer UP poistion ${details.position}");
                              booldot1 = false;
                              booldot2 = false;
                              booldot3 = false;
                              booldot4 = false;
                              booldot5 = false;
                              booldot6 = false;
                              // valuesSee = values.toString();
                              valuesPass = values.toString();
                              if (isOff) {
                                valuesPass = "";
                              }
                              // valuesSee = removeListDebree(valuesSee);
                              valuesPass = removeListDebree(valuesPass);
                              values.clear();
                              setState(() {});
                            },
                            child: Container(
                              key: _fullContainer,
                              color: Colors.black,
                              // height: getPercentSize(100, true, context),
                              // width: -getPercentSize(100, false, context),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                    height: sizeOfDotHightSpace - 60,
                                  ),
                                  Container(
                                    child: Text(
                                      "$wrongWrite",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "$vulDhora",
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
            ),
          ),
        ),
      ),
    );
  }
}

class _DragHandler extends Drag {
  _DragHandler(this.onUpdate, this.onEnd);

  final GestureDragUpdateCallback onUpdate;
  final GestureDragEndCallback onEnd;

  @override
  void update(DragUpdateDetails details) {
    onUpdate(details);
  }

  @override
  void end(DragEndDetails details) {
    onEnd(details);
  }

  @override
  void cancel() {}
}
