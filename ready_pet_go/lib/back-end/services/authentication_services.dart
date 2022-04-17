import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ready_pet_go/back-end/models/user.dart';

class AuthenticationServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<String> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // debugPrint("Login successfully auth services!!!");
      return "successfully signed in";
    } catch (e) {
      // debugPrint(e.toString());
      return e.toString();
    }
  }

  Future<String> register(String email, String password, String name) async {
    try {
      // final _auth = FirebaseAuth.instance;
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postUserDetails(name)});
      return "successfully registered";
    } catch (signUpError) {
      return signUpError.toString();
    }
  }

  void postUserDetails(String name) async {
    User? user = _firebaseAuth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = name;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
  }
}
