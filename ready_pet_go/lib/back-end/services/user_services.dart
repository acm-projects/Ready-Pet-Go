import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ready_pet_go/back-end/models/user.dart';


class UserServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //get
  Stream<List<UserModel>> getUsers() {
    return _db.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList());
  }

  //upsert
  Future<void> setUser(UserModel user) {
    var options = SetOptions(merge: true);
    return _db.collection('users').doc(user.uid).set(user.toMap(), options);
  }

  //delete
  Future<void> removeEntry(String userId) {
    return _db.collection('users').doc('userId').delete();
  }
}
