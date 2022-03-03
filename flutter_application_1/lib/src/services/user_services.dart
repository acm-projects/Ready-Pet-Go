import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/src/models/user.dart';


class User_Services {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //get
  Stream<List<User>> getUsers() {
    return _db.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
  }

  //upsert
  Future<void> setUser(User user) {
    var options = SetOptions(merge: true);
    return _db.collection('users').doc(user.userId).set(user.toMap(), options);
  }

  //delete
  Future<void> removeEntry(String userId) {
    return _db.collection('users').doc('userId').delete();
  }
}
