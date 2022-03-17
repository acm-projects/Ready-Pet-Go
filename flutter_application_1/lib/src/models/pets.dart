

class Pet {
  final String petId;
  final String name;
  final String age;
  final String breed;
  final String? picture;
  final String? mood;
  final Map expenses;
  final Map tasks;

  Pet(
      {required this.petId,
      required this.name,
      required this.age,
      required this.breed,
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
