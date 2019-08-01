import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthImpl {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> signOut();
}

class Auth implements AuthImpl {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    // FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
    //     email: email, password: password);
        AuthResult result=await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return  result.user.uid;
  }

  Future<String> signUp(String email, String password) async {
    // FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(
    //     email: email, password: password);
        AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authResult.user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
