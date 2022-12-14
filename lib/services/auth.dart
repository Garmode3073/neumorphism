import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:noti/models/userinapp.dart';
import 'package:noti/globals.dart' as g;

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get stream of user changes
  Stream<UserinApp> get userInApp {
    return _auth.userChanges().map((event) {
      if (event == null) {
        return UserinApp.fromMap({
          "uid": "0",
          "email": "",
          "password": "",
        });
      }
      UserinApp user = UserinApp.fromMap({
        "uid": event.uid,
        "email": event.email,
        "password": "",
      });
      // DBServices().getType(event.uid).then((value) {
      //   user.type = value;
      // });

      return user;
    });
  }

  //register
  Future register(String email, String password) async {
    var user;
    try {
      user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on PlatformException catch (err) {
      return err.message;
    } catch (e) {
      return e.toString();
    }

    g.user = UserinApp.fromMap(
        {"uid": user.user.uid, "email": email, "password": ""});
    return g.user;
  }

  //sign in
  Future signIn(String email, String password) async {
    var user;
    try {
      user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on PlatformException catch (err) {
      return err.message;
    } catch (e) {
      return e.toString();
    }

    g.user = UserinApp.fromMap(
        {"uid": user.user.uid, "email": email, "password": ""});
    return g.user;
  }

  //sign out
  Future signout() async {
    await _auth.signOut();
  }
}
