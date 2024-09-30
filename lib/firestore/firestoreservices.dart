import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Add or update user data
  Future<void> saveUserData(String name, String email, String imageUrl) async {
    try {
      // Ensure the user is logged in
      final userId = _auth.currentUser?.uid;
      if (userId == null) {
        throw Exception('No user is currently logged in');
      }

      // Validate inputs
      if (name.isEmpty || email.isEmpty || imageUrl.isEmpty) {
        throw Exception('Name, email, and image URL cannot be empty');
      }

      // Create or update the user document
      await _db.collection('users').doc(userId).set({
        'name': name,
        'email': email,
        'image': imageUrl,
      }, SetOptions(merge: true)); // Use merge to update existing data

      print('User data saved successfully');
    } catch (e) {
      print('Error saving user data: $e');
    }
  }
}
