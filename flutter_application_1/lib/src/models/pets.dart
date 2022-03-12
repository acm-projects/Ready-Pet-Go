import 'package:flutter/services.dart';

class Pet {
  final petId;
  final name;
  final age;
  final breed;
  final picture;
  final mood;
  final Map expenses;
  final Map tasks;

  Pet(
      {required this.petId,
      required this.name,
      required this.age,
      this.breed,
      this.picture,
      this.mood,
      required this.expenses,
      required this.tasks});

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
        petId: json['petId'],
        name: json['name'],
        age: json['age'],
        breed: json['breed'],
        picture: json['picture'],
        mood: json['mood'],
        expenses: json['expenses'],
        tasks: json['tasks']);
  }

  Map<String, dynamic> toMap() {
    return ({
      'petId': petId,
      'name': name,
      'age': age,
      'breed': breed,
      'picture': picture,
      'mood': mood,
      'expenses': expenses,
      'tasks': tasks,
    });
  }
}
