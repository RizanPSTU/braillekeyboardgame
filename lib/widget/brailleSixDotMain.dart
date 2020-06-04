import 'package:braillekeyboardgame/constant/constants.dart';
import 'package:braillekeyboardgame/function/getPercentage.dart';
import 'package:braillekeyboardgame/screens/homeScreen.dart';
import 'package:braillekeyboardgame/screens/loginScreen.dart';
import 'package:braillekeyboardgame/screens/playScreen.dart';
import 'package:braillekeyboardgame/screens/settingsScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';

AudioCache player = AudioCache(prefix: 'audio/');
bool isNumberActive = false;
bool isPressed = false;

//Ai duita home thika nitasi abong aita aise o firebase thika
String mainCode = "";

//bivinno vul dorar msg dibo => aita hy nai x hoibo
String vulDhora = "";
//wringWrite r mainCode same hoile jita
String wrongWrite = "";

int currentPos = -1;
int mainCurrentPos = 0;

playsound() async {
  if (soundAndEffect) {
    player.play('pop.mp3');
  }

  HapticFeedback.vibrate();
}

playspace() async {
  if (soundAndEffect) {
    player.play('delete.m4a');
  }

  HapticFeedback.vibrate();
}

playdelete() async {
  if (soundAndEffect) {
    player.play('space.mp3');
  }

  HapticFeedback.vibrate();
}

vibrate() {
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

  bool inDeley = false;

  @override
  void initState() {
    super.initState();
    isNumberActive = false;
    isWon = false;
    isPressed = false;
    inDeley = false;

    mainCode = code;
    // mainPoint = pointInt;
    // wonText = win;

    vulDhora = "";
    wrongWrite = "";

    currentPos = -1;
    mainCurrentPos = 0;
  }

  @override
  Widget build(BuildContext context) {
    double sizeOfDot = getPercentSize(20, true, context);
    double sizeOfDotSpace = getPercentSize(20, false, context);
    ;
    double sizeOfDotHightSpace = getPercentSize(8, true, context);
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
            playspace();
            print("Right Swipe");
            isright = true;
            isLeft = false;
          } else if (rightC < leftC &&
              details.velocity.pixelsPerSecond.dx < -150) {
            playdelete();
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
        key: key,
        decoration: BoxDecoration(
          color: isActive == true ? thirdHeadColor : Colors.white,
          shape: BoxShape.circle,
        ),
      );
    }

    if (jsonAlfabete != null && valuesPass.length > 0 && jsonNumber != null) {
      charPress = cheackWhatPressedAndWhatShouldBePressed(valuesPass);
      valuesPass =
          ""; //jeita dot thika aisilo 1,2,4 amn type oita re "" amon korar jonno use korse
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
        if (!inDeley) {
          if (isPressed) {
            if (charPress != "D" && charPress != "N") {
              // N = number mode and D = delete
              if (charPress != "U") {
                // U = unknown
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
                          "Debe ser la Space no la ${wrongWrite[currentPos]}"; // Should Space not $
                    } else {
                      vulDhora =
                          "Debe ser la ${mainCode[mainCurrentPos]} no la ${wrongWrite[currentPos]}"; // Should be $ not $
                    }
                  }
                } else {
                  vulDhora =
                      "Borrar carácter de más"; // Remoce extraa charecter
                }
              } else {
                vulDhora =
                    "Esta combinación de braille no existe"; //“Unknown braillie combination”
              }
            }

            if (charPress == "N") {
              if (isNumberActive) {
                vulDhora =
                    "El teclado numérico está activado"; //"Number mode activated"
              } else {
                vulDhora =
                    "El teclado numérico está desactivado."; // Number mode deactivated
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
                  vulDhora = "Nada que borrar"; // Remove extra charecter
                }
              } else if (currentPos == 0) {
                wrongWrite = "";
                currentPos = -1;
              } else if (currentPos == -1) {
                vulDhora = "Nada que borrar"; // Remove extra charecter
              } else {
                vulDhora =
                    "No hay nada más que borrar"; //Already got right no need to delete
              }
            }

            isPressed = false;
            charPress = "";
            // print("Write ===>$write");
            // print("is pr ===>$currentPos");
          }
        }
      } else {
        wrongWrite = "";
        if (timer.isActive) {
          timer.cancel();
        }
        vulDhora = "¡Ganaste!"; // You won
      }
    } else {
      wrongWrite = "";
      vulDhora = "¡Tiempo terminado!"; //“Time finished”
    }

    if (mainCurrentPos == mainCode.length) {
      isWon = true;
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: getPercentSize(100, true, context),
          width: getPercentSize(100, false, context),
          color: Color(0xff212121),
          child: Center(
            child: isOff
                ? Container(
                    height: getPercentSize(100, true, context),
                    width: getPercentSize(100, false, context),
                    color: Colors.black,
                  )
                : Container(
                    // color: Colors.white,
                    height: getPercentSize(100, true, context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Semantics(
                          liveRegion: true,
                          // explicitChildNodes: true,
                          // readOnly: true,

                          child: Listener(
                            onPointerMove: (PointerEvent details) {
                              // print("on move");
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
                                  //Feel the vibration
                                  vibrate();
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
                                  //Feel the vibration
                                  vibrate();
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
                                  //Feel the vibration
                                  vibrate();
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
                                  //Feel the vibration
                                  vibrate();
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
                                  //Feel the vibration
                                  vibrate();
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
                                  //Feel the vibration
                                  vibrate();
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
                              // print("on up");
                              // print("Pointer UP local ${details.localPosition}");
                              // print("Pointer UP poistion ${details.position}");
                              valuesPass = values.toString();
                              valuesPass = removeListDebree(valuesPass);
                              // setState(() {});
                              if (inDeley == false) {
                                inDeley = true;
                                Future.delayed(
                                    const Duration(milliseconds: 650), () {
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
                                  inDeley = false;
                                });
                              }
                            },
                            child: Container(
                              key: _fullContainer,
                              color: Color(0xff212121),
                              // height: getPercentSize(100, true, context),
                              // width: -getPercentSize(100, false, context),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topCenter,
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
                                    height: 10,
                                  ),
                                  Text(
                                    "$wrongWrite",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "$vulDhora",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
