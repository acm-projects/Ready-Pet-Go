import 'package:cloud_firestore/cloud_firestore.dart';


import '../models/pet.dart';

class PetServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String userId;
  PetServices(this.userId);

  //get
  Stream<List<Pet>> getPets() {
    
   
    return _db
        .collection('users')
        .doc(userId)
        .collection('pets')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Pet.fromMap(doc.data()))
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
        .doc(pet.petID)
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
