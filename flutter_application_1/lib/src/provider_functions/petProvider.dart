import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/models/pets.dart';

import 'package:flutter_application_1/src/services/pet_services.dart';
import 'package:uuid/uuid.dart';

class PetProvider with ChangeNotifier {
  final petService = Pet_Services();
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
        tasks: {});
    petService.setPet(userId, newPet);
    //print(newPet.breed);
    return newPet;
  }

  Future<Pet> getPet(userId, petId) async {
    Stream<List<Pet>> pets = petService.getPets(userId);
    List<Pet> allPets = await pets.first;
    for (int i = 0; i < allPets.length; i++) {
      if (allPets[i].petId == petId) {
        return allPets[i];
      }
    }
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
