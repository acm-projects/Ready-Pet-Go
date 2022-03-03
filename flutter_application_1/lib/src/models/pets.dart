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
      {required this.name,
      required this.age,
      required this.petId,
      this.breed,
      this.picture,
      this.mood,
      required this.expenses,
      required this.tasks});

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
        name: json['name'],
        age: json['age'],
        petId: json['petId'],
        breed: json['breed'],
        picture: json['picture'],
        mood: json['mood'],
        expenses: json['expenses'],
        tasks: json['tasks']);
  }

  Map<String, dynamic> toMap() {
    return ({
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
