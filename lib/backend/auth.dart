import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

String uid = "";

Future oldToNew() async {
  var map = new Map<String, dynamic>();
  map['new'] = 1;
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

Future<int> checkOldToNew() async {
  try {
    var map = await Firestore.instance.collection('/users').document(uid).get();
    print(uid);
    print(map.data["new"]);
    return map.data["new"];
  } catch (e) {
    print(e);
    return -1;
  }
}

class AuthService {
  // Dependencies
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  // Shared State for Widgets
  Observable<FirebaseUser> user; // firebase user
  Observable<Map<String, dynamic>> profile; // custom user data in Firestore
  PublishSubject loading = PublishSubject();

  // constructor
  AuthService() {
    user = Observable(_auth.onAuthStateChanged);

    profile = user.switchMap((FirebaseUser u) {
      if (u != null) {
        uid = u.uid;
        return _db
            .collection('users')
            .document(u.uid)
            .snapshots()
            .map((snap) => snap.data);
      } else {
        return Observable.just({});
      }
    });
  }

  Future<FirebaseUser> googleSignIn() async {
    // Start
    loading.add(true);

    // Step 1
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    // Step 2
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    // Step 3
    updateUserData(user);

    // Done
    loading.add(false);
    print("signed in " + user.displayName);
    return user;
  }

  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now(),
      'new': 0,
    }, merge: true);
  }

  void signOut() {
    _auth.signOut();
  }
}

final AuthService authService = AuthService();
