import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/src/models/user.dart';

import '../models/pets.dart';

class Pet_Services {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  var userId;
  Pet_Services(String this.userId);

  //get
  Stream<List<Pet>> getPets() {
    print("getPets service working...");
    print(this.userId);
    return _db
        .collection('users')
        .doc(this.userId)
        .collection('pets')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Pet.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }

  //upsert
  Future<void> setPet(String userId, Pet pet) {
    var options = SetOptions(merge: true);
    // print("petId: " + pet.petId);
    // print("tasks+" + pet.tasks.toString());
    return _db
        .collection('users')
        .doc(userId)
        .collection('pets')
        .doc(pet.petId)
        .set(pet.toMap(), options);
  }

  //delete
  Future<void> removePet(String petId) {
    return _db
        .collection('users')
        .doc('userId')
        .collection('pets')
        .doc(petId)
        .delete();
  }
}
