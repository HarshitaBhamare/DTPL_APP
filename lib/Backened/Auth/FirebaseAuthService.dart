import 'package:dtpl_app/Providers/loadingProvider.dart';
import 'package:dtpl_app/Providers/msgBoxProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Register with email and password
  Future<UserCredential?> registerWithEmailAndPassword(
      String email,
      String password,
      BuildContext context,
      AnimationController animationController) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await Future.delayed(Duration(seconds: 1));
      Provider.of<LoadingProvider>(context, listen: false).hideLoading();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle different Firebase Auth exceptions here
      print(e.message);
      Provider.of<LoadingProvider>(context, listen: false).hideLoading();
      Provider.of<MsgBoxProvider>(context, listen: false).ShowHide(
          true, context, animationController,
          MsgText: e.message ?? 'An error occurred');
      return null;
    }
  }

  // Sign in with email and password
  Future<UserCredential?> signInWithEmailAndPassword(
      String email,
      String password,
      BuildContext context,
      AnimationController animationController) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Signed in user: ${FirebaseAuth.instance.currentUser?.email}");
      await Future.delayed(Duration(seconds: 1));
      Provider.of<LoadingProvider>(context, listen: false).hideLoading();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle exceptions
      print("Error Message ${e.message}");
      Provider.of<LoadingProvider>(context, listen: false).hideLoading();
      Provider.of<MsgBoxProvider>(context, listen: false).ShowHide(
          true, context, animationController,
          MsgText: e.message ?? 'An error occurred');
      // MsgText: "Invalid Credentials Please ReCheck");
      // WaitTillEnd();
      return null;
    }
  }

  // Add other authentication related methods as needed (e.g., sign out)
}
