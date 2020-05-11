import 'package:cloud_firestore/cloud_firestore.dart';

Stream<QuerySnapshot> getDedicationNumber() {
  Stream<QuerySnapshot> levels =
      Firestore.instance.collection('/level').orderBy("id").snapshots();
  // .document(uid)
  // .collection('dedication')
  // .where("seen", isEqualTo: "0")

  return levels;
}

Stream<QuerySnapshot> getScoreBoard() {
  Stream<QuerySnapshot> levels = Firestore.instance
      .collection('/users')
      .orderBy("totalScore", descending: true)
      .snapshots();
  // .document(uid)
  // .collection('dedication')
  // .where("seen", isEqualTo: "0")

  return levels;
}
