import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/models/pets.dart';
import 'package:flutter_application_1/src/provider_functions/taskProvider.dart';

import 'package:flutter_application_1/src/services/pet_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final petStateProvider = StateProvider<Pet?>((ref) {
  final petService = PetProvider();
  print("whassup");
  Future<Pet> a = petService.getFirstPet("01203102");
  Pet? fpet;
  a.then((Pet value) {
    fpet = value;
    print("hey");
    return fpet;
  });
  return fpet;
});

class PetProvider with ChangeNotifier {
  final petService = Pet_Services('01203102');
  late String _petId;

  var uuid = Uuid();

  String get petId => _petId;

  Pet initializePet(
      String userId, String name, String breed, String startingAge) {
    _petId = uuid.v4();
    Pet newPet = new Pet(
        name: name,
        age: startingAge,
        petId: _petId,
        breed: breed,
        expenses: {},
        tasks: {
          'Feed dog': false,
          'Walk dog': false,
          'Play dog': false,
        });
    petService.setPet(userId, newPet);
    //print(newPet.breed);
    return newPet;
  }

  Future<Pet> getPet(userId, petId) async {
    Stream<List<Pet>> pets = petService.getPets();
    List<Pet> allPets = await pets.first;
    for (int i = 0; i < allPets.length; i++) {
      if (identical(petId, allPets[i].petId)) {
        print("hello world");
        return allPets[i];
      }
    }
    print("not good");
    return allPets[0];
  }

  Future<Pet> getFirstPet(userId) async {
    Stream<List<Pet>> pets = petService.getPets();
    List<Pet> allPets = await pets.first;
    print(allPets[0].name);
    return allPets[0];
  }
  /*
    functions to do:
      - get pet by pet id, return variables such as mood, tasks, picture, name
      - be able to change tasks by saying "set task x to be true"
      - first time initialization of pet
      - and more!

  */
}
