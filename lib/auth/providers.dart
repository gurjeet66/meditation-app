import 'package:firebaseseries/screen/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignupProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;

  // Get the current user
  User? get user => _user;

  // Check if the user is logged in
  bool get isLoggedIn => _user != null;

  // Signup function
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Sign up the user using FirebaseAuth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user information in Firestore
      _user = userCredential.user;
      await _firestore.collection("users").doc(_user!.uid).set({
        "name": name,
        "email": email,
        "password": password,
        "createdAt": DateTime.now(),
      });

      // Notify listeners that the user is signed up
      notifyListeners();

      // Navigate to the home screen after signup
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MeditationHomeScreen(),
          ));
    } catch (e) {
      print("Error during sign up: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup Failed: $e")),
      );
    }
  }

  // Login function
  Future<bool> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        _user = userCredential.user;

        notifyListeners();

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MeditationHomeScreen()));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Login error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Failed: $e")),
      );
      return false;
    }
  }

// SignInWithApple

  Future<bool> signInWithApple(BuildContext context) async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Create an OAuth credential using the obtained tokens
      final OAuthCredential appleCredential =
          OAuthProvider("apple.com").credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );

      // Sign in with the credential
      final UserCredential userCredential =
          await _auth.signInWithCredential(appleCredential);

      // Store user information in Firestore
      _user = userCredential.user;
      await _firestore.collection("users").doc(_user!.uid).set({
        "email": _user!.email,
        "createdAt": DateTime.now(),
      });

      notifyListeners();

      // Navigate to the home screen
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MeditationHomeScreen()));
    } catch (e) {
      print("Error during Apple sign in: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Apple Sign-In Failed: $e")),
      );
    }
    return false;
  }
  


  // Automatically sign in the user if they are logged in
  Future<void> autoLogin() async {
    _user = _auth.currentUser;
    notifyListeners();
  }

  // Sign out function
  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }

  // Anonymous guest login
  Future<bool> signInAnonymously(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;

      // Set the guest username
      if (user != null) {
        await user.updateDisplayName("Guest");
      }

      // Navigate to the main screen after guest login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MeditationHomeScreen()),
      );
    } catch (e) {
      print("Error during anonymous login: $e");
    }
    return false;
  }
}
