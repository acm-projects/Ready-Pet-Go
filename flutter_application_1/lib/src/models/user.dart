import 'pets.dart';

class User {
  final userId;
  final familyName;
  final familyId;
  final Pet? pet;

  User({required this.userId, this.familyName, this.familyId, this.pet});

  factory User.fromJson(Map<String, dynamic> json) {
    return (User(
        userId: json['userId'],
        familyName: json['familyName'],
        familyId: json['familyId'],
        pet: json['Pet']));
  }

  Map<String, dynamic> toMap() {
    return ({
      'userId': userId,
      'familyName': familyName,
      'familyId': familyId,
      'pet': pet
    });
  }
}
