import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/models/pets.dart';
import 'package:flutter_application_1/src/provider_functions/taskProvider.dart';

import 'package:flutter_application_1/src/services/pet_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final changeState = Provider(((ref) => {
      ref.listen(taskStateProvider, (previous, next) {
        print("task state has changed");
      })
    }));

final petFutureStateProvider = FutureProvider<Pet?>((ref) async {
  final petProvider = PetProvider();
  return await petProvider.getFirstPet("01203102");
});

final petChangeProvider = ChangeNotifierProvider<PetProvider>(
  (ref) {
    return PetProvider();
  },
);
final petStateProvider = StateProvider(((ref) {
  final petFuture = ref.watch(petFutureStateProvider);
  return petFuture.value;
}));

class PetProvider with ChangeNotifier {
  final petService = Pet_Services('01203102');
  late String _petId;
  Pet? currentPet = null;
  PetProvider();
  var uuid = Uuid();

  String get petId => _petId;
  Pet? get getCurrentPet => currentPet;

  Pet initializePet(
      String userId, String name, String breed, String startingAge) {
    _petId = uuid.v4();
    Pet newPet = Pet(
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
    petService.setPet(newPet);
    currentPet = newPet;
    notifyListeners();
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
    currentPet = allPets[0];
    notifyListeners();
    return allPets[0];
  }

  Future<Pet> getFirstPet(userId) async {
    Stream<List<Pet>> pets = petService.getPets();
    List<Pet> allPets = await pets.first;
    currentPet = allPets[0];
    notifyListeners();
    return allPets[0];
  }

  void updatePet() {
    print("bruh");
    print(currentPet!.tasks);
    notifyListeners();
    petService.setPet(currentPet!);
  }
  /*
    functions to do:
      - get pet by pet id, return variables such as mood, tasks, picture, name
      - be able to change tasks by saying "set task x to be true"
      - first time initialization of pet
      - and more!

  */
}
