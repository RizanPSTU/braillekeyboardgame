import 'package:braillekeyboardgame/backend/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Stream<QuerySnapshot> getDedicationNumber() {
  Stream<QuerySnapshot> levels =
      Firestore.instance.collection('/level').orderBy("id").snapshots();
  // .document(uid)
  // .collection('dedication')
  // .where("seen", isEqualTo: "0")

  return levels;
}



