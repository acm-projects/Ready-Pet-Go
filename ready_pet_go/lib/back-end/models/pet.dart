class Pet {
  String? petID;
  String? name;
  int? age;
  String? breed;
  // final picture;
  String? mood;
  Map? expenses;
  Map? tasks;

  Pet(
      {required this.name,
      required this.age,
      this.petID,
      required this.breed,
      // this.picture,
      this.mood,
      this.expenses,
      this.tasks});

  //data from server
  factory Pet.fromMap(map) {
    return Pet(
        name: map['name'],
        age: map['age'],
        petID: map['petID'],
        breed: map['breed'],
        // picture: json['picture'],
        mood: map['mood'],
        expenses: map['expenses'],
        tasks: map['tasks']);
  }

  Map<String, dynamic> toMap() {
    return ({
      'name': name,
      'age': age,
      'breed': breed,
      // 'picture': picture,
      'mood': mood,
      'expenses': expenses,
      'tasks': tasks,
    });
  }
}
