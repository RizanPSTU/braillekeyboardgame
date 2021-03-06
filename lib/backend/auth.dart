import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

String uid = "";
String proUrl = "";
String name = "";
final Firestore _db = Firestore.instance;

Future<SharedPreferences> prefUPN = SharedPreferences.getInstance();

Future<void> setUserDataNull() async {
  final SharedPreferences prefs = await prefUPN;

  await prefs.setString("uid", null);
}

Future<void> setUserData() async {
  final SharedPreferences prefs = await prefUPN;

  await prefs.setString("uid", uid);
  await prefs.setString("proUrl", proUrl);
  await prefs.setString("name", name);
}

Future<bool> getUserData() async {
  final SharedPreferences prefs = await prefUPN;
  String checkUID = prefs.getString("uid");
  if (checkUID != null) {
    uid = checkUID;
    proUrl = prefs.getString("proUrl");
    name = prefs.getString("name");
    return true;
  } else {
    return false;
  }
}

Future newToOld() async {
  var map = new Map<String, dynamic>();
  map['new'] = 1; // new 1 old :3 -1 akdom notun
  try {
    await Firestore.instance
        .collection('/users')
        .document(uid)
        .setData(map, merge: true)
        .whenComplete(() => print('just new user'));
  } catch (e) {
    print(e);
  }
}

Future<int> checkNewOrOld() async {
  try {
    var map = await Firestore.instance.collection('/users').document(uid).get();
    print(uid);
    print(map.data["new"]);
    return map.data["new"];
  } catch (e) {
    print("Dekhi   $e");
    return -1;
  }
}

setEveryValue(FirebaseUser user) async {
  uid = user.uid;
  proUrl = user.photoUrl;
  name = user.displayName;
  await setUserData();
  updateUserData(user);
}

//Google Sign In
GoogleSignIn _googleSignIn = new GoogleSignIn();

//Facebook Sign In
FacebookLogin _facebookSignIn = new FacebookLogin();

FirebaseUser user;
Future<void> googleSignIn() async {
  GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);
  user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  // print(user.uid);
  setEveryValue(user);
}

Future<Null> facebookSignIn() async {
  final FacebookLoginResult result = await _facebookSignIn.logIn(['email']);

  AuthCredential credential =
      FacebookAuthProvider.getCredential(accessToken: result.accessToken.token);

  user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  // print(user.uid);
  setEveryValue(user);
}

void updateUserData(FirebaseUser user) async {
  DocumentReference ref = _db.collection('users').document(user.uid);

  int oldOrNew = await checkNewOrOld();
  print("old or new val : $oldOrNew");

  return ref.setData({
    'uid': user.uid,
    'email': user.email,
    'photoURL': user.photoUrl,
    'displayName': user.displayName,
    'lastSeen': DateTime.now(),
    'new': oldOrNew,
  }, merge: true);
}
