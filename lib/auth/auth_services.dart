//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebaseseries/screen/widgets/customexercise1.dart';

import 'package:flutter/services.dart'; 
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
 //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Function to create a user with email and password
  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return cred.user;
        

      // Store user information in Firestore
     
      

    } catch (e) {
      print("Something went wrong: $e");
    }
    return null;
  }

  // Function to sign in with Apple
  Future<User?> signInWithApple({List<AppleIDAuthorizationScopes> scopes = const []}) async {
    try {
      // Perform Apple sign-in request
      final AuthorizationCredentialAppleID results = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Create OAuth credential
      final OAuthCredential oAuthCredential = OAuthProvider("apple.com").credential(
        idToken: results.identityToken,
        accessToken: results.authorizationCode,
      );

      // Sign in to Firebase with the generated credential
      final UserCredential userCredential = await _auth.signInWithCredential(oAuthCredential);
      final User? firebaseUser = userCredential.user;

      // Optionally update the display name with full name (if provided)
      if (scopes.contains(AppleIDAuthorizationScopes.fullName) &&
          results.givenName != null &&
          results.familyName != null) {
        final displayName = "${results.givenName} ${results.familyName}";
        await firebaseUser?.updateDisplayName(displayName);
      }

      return firebaseUser;
    } on PlatformException catch (e) {
      print("Error signing in with Apple: ${e.message}");
      throw e;
    } catch (e) {
      print("An unknown error occurred: $e");
      throw e;
    }
  }
}
