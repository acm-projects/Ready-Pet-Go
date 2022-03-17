import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../models/user.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    //print(e.toString());
    return false;
  }
}

Future<bool> register(String email, String password, String name, int age) async {
  try {
    final _auth = FirebaseAuth.instance;
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore(_auth, name,age)});
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak password') {
      print('The password is too weak.');
    } else if (e.code == 'email-alread-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

void postDetailsToFirestore(FirebaseAuth _auth, String name, int age) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = _auth.currentUser;

  UserModel userModel = UserModel(uid: user!.uid);

  userModel.email = user.email;
  userModel.uid = user.uid;
  userModel.name = name;
  userModel.age = age;

  await firebaseFirestore
  .collection("users")
  .doc(user.uid)
  .set(userModel.toMap());
}



