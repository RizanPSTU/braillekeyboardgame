import 'package:cloud_firestore/cloud_firestore.dart';
import './auth.dart';

Future saveScore(int totalScore) async {
  var map = new Map<String, dynamic>();
  map['totalScore'] = totalScore;
  try {
    await Firestore.instance
        .collection('/users')
        .document(uid)
        .collection('data')
        .document(uid)
        .setData(map, merge: true)
        .whenComplete(() => print('Score Saved'));
  } catch (e) {
    print(e);
  }
}

Future<int> getScore() async {
  var map;
  try {
    map = await Firestore.instance
        .collection('/users')
        .document(uid)
        .collection('data')
        .document(uid)
        .get();
    return map['totalScore'];
  } catch (e) {
    print(e);
    return -1;
  }
}

Future saveLevel(int comlevel) async {
  var map = new Map<String, dynamic>();
  map['comlevel'] = comlevel;
  try {
    await Firestore.instance
        .collection('/users')
        .document(uid)
        .collection('data')
        .document(uid)
        .setData(map, merge: true)
        .whenComplete(() => print('Level Saved'));
  } catch (e) {
    print(e);
  }
}

Future<int> getLevel() async {
  var map;
  try {
    map = await Firestore.instance
        .collection('/users')
        .document(uid)
        .collection('data')
        .document(uid)
        .get();
    return map['comlevel'];
  } catch (e) {
    print(e);
    return -1;
  }
}
