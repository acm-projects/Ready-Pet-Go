import 'pets.dart';

class UserModel {
  String  uid;
  String? name;
  int?  age;
  String?  email;
   Pet? pet;

  UserModel({required this.uid, this.name, this.age, this.email, this.pet});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return (UserModel(
        uid: json['userId'],
        name: json['name'],
        age: json['age'],
        email: json['email'],
        pet: json['Pet']));
  }

  Map<String, dynamic> toMap() {
    return ({
      'uid': uid,
      'name': name,
      'age': age,
      'email' : email,
      'pet': pet
    });
  }
}
