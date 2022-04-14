import 'package:ready_pet_go/back-end/models/pet.dart';

class UserModel {
  String? uid;
  String? name;
  String? email;
  Pet? pet;

  UserModel({this.uid, this.name, this.email, this.pet});

  //data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      pet: map['pet'],
    );
  }

  //send data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }
}
