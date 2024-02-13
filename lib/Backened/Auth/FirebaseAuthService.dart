import 'package:dtpl_app/Pages/AuthPages/landingPage.dart';
import 'package:dtpl_app/Pages/HomePages/homePage.dart';
import 'package:dtpl_app/Providers/loadingProvider.dart';
import 'package:dtpl_app/Providers/msgBoxProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
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

  Future<void> signOut(BuildContext context) async {
    try {
      // Sign out from Firebase
      Provider.of<LoadingProvider>(context, listen: false).showLoading();
      await FirebaseAuth.instance.signOut();

      // Optionally, navigate the user to the sign-in page after signing out
      // ignore: use_build_context_synchronously
      await Future.delayed(Duration(seconds: 2));
      Provider.of<LoadingProvider>(context, listen: false).hideLoading();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      // Handle any errors here
      print("Error signing out: $e");
      Provider.of<LoadingProvider>(context, listen: false).hideLoading();

      // Provider.of<MsgBoxProvider>(context, listen: false).ShowHide(
      //     true,
      //     context,
      //     null, // Assuming you don't need an AnimationController for showing messages
      //     MsgText: e.toString() ?? 'An error occurred during sign out');
    }
  }

  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try {
      // Trigger the authentication flow
      Provider.of<LoadingProvider>(context, listen: false).showLoading();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      // Abort if user cancels the sign in process
      if (googleSignInAccount == null) return null;

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);

      // Optionally, navigate to the HomePage after a successful sign in
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomePage()),
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
          (route) => false);

      Provider.of<LoadingProvider>(context, listen: false).hideLoading();

      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle Firebase authentication errors
      print("Firebase Auth Error: ${e.message}");
      return null;
    } catch (e) {
      // Handle other errors
      print("Error signing in with Google: $e");
      Provider.of<LoadingProvider>(context, listen: false).hideLoading();

      return null;
    }
  }

  Future<void> signOutGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    Provider.of<LoadingProvider>(context, listen: false).showLoading();

    try {
      // Sign out from Google
      await googleSignIn.signOut();
      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Optionally, navigate the user to the sign-in page after signing out
      await Future.delayed(Duration(seconds: 2));
      Provider.of<LoadingProvider>(context, listen: false).hideLoading();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    } catch (e) {
      // Handle errors (e.g., show a message)
      print("Error signing out: $e");
      // Using Provider or any other state management to show the error message
      // This is just a placeholder, replace with your actual error handling mechanism\
      Provider.of<LoadingProvider>(context, listen: false).hideLoading();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out. Try again.')),
      );
    }
  }

  Future<Widget?> getProfilePic() async {
    if (_firebaseAuth.currentUser?.photoURL != null) {
      return Container(
        alignment: Alignment.center,
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
                image: NetworkImage(
              _firebaseAuth.currentUser!.photoURL!,
            ))),
      );
    } else {
      // Return a default image or placeholder if photoURL is null
      return Container(
          height: 80,
          width: 80,
          child: Icon(
            Icons.person,
            size: 60,
          )); // Replace with your asset path
    }
  }
}
