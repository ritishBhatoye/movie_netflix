import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user; // To store the current user

  // Getter to retrieve the current user
  User? get currentUser => _user;

  // Constructor to initialize the user stream
  AuthService() {
    _user = _auth.currentUser; // Initialize _user with the current user
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      if (user == null) {
        // User is not authenticated, navigate to HomeScreen
        log('Navigate to HomeScreen');
      } else {
        // User is authenticated, navigate to SignupScreen
        log('Navigate to SignupScreen');
      }
    });
  }

  // Function to create a user with email and password
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      log('SOMETHING WENT WRONG!');
      return null;
    }
  }

  // Function to sign in user with email and password
  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      log('SOMETHING WENT WRONG!');
      return null;
    }
  }

  // Function to sign out user
  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log('SOMETHING WENT WRONG!');
    }
  }
}