
import 'package:flutter_application_1/src/models/pets.dart';


import 'package:flutter_application_1/src/services/pet_services.dart';

class NewTaskProvider {
  Pet pet;
  final String userId;
  
  NewTaskProvider(this.pet, this.userId);

  void toggleTask(taskName) {
    final petService = PetServices(userId);
    //print(pet.name);
    bool initialVal = pet.tasks[taskName];
   
    if (initialVal == true) {
      
      pet.tasks[taskName] = false;
      petService.setPet(userId, pet);
      //return false;
    } else {
      
      pet.tasks[taskName] = true;
      petService.setPet(userId, pet);
      //return true;
    }
    //print(initialVal);
  }

  void addTask(taskName) {
    final petService = PetServices(userId);
    pet.tasks.putIfAbsent(taskName, () => false);
    petService.setPet(userId, pet);
  }

  void deleteTask(taskName) {
    final petService = PetServices(userId);
    pet.tasks.remove(taskName);
    petService.setPet(userId, pet);
  }
}
