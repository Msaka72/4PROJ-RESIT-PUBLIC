import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      var userCred =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User user = userCred.user!;

      await FirebaseFirestore.instance
          .collection("Users_Data")
          .doc(user.email)
          .set(
        {
          "firstName": user.displayName,
          "email": user.email,
          "status": " Volunteer",
          "image": user.photoURL
        },
      );
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
