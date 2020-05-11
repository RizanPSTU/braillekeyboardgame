import 'package:cloud_firestore/cloud_firestore.dart';
import './auth.dart';

Future<int> saveScore(int totalScore) async {
  var map = new Map<String, dynamic>();
  map['totalScore'] = totalScore;
  try {
    await Firestore.instance
        .collection('/users')
        .document(uid)
        .setData(map, merge: true)
        .whenComplete(() => print('Score Saved'));
    return 1;
  } catch (e) {
    print(e);
    return 0;
  }
}

Future<int> getScore() async {
  var map;
  try {
    map = await Firestore.instance.collection('/users').document(uid).get();
    return map['totalScore'];
  } catch (e) {
    print(e);
    return 0;
  }
}

Future<int> saveLevel(int comlevel) async {
  var map = new Map<String, dynamic>();
  map['comlevel'] = comlevel;
  try {
    await Firestore.instance
        .collection('/users')
        .document(uid)
        .setData(map, merge: true)
        .whenComplete(() => {});
    return 1;
  } catch (e) {
    print(e);
    return 0;
  }
}

Future<int> getLevel() async {
  var map;
  try {
    map = await Firestore.instance.collection('/users').document(uid).get();
    return map['comlevel'];
  } catch (e) {
    print(e);
    return -1;
  }
}

Future<int> saveCountryAndProfessirOrStudet(String country, bool isPro) async {
  var map = new Map<String, dynamic>();
  map['country'] = country;
  map['isPro'] = isPro;
  try {
    await Firestore.instance
        .collection('/users')
        .document(uid)
        .setData(map, merge: true)
        .whenComplete(() => {});
    return 1;
  } catch (e) {
    print(e);
    return 0;
  }
}
