import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/models/pets.dart';
import 'package:flutter_application_1/src/provider_functions/petProvider.dart';

import 'package:flutter_application_1/src/services/pet_services.dart';

class newTaskProvider {
  Pet pet;
  final petService = Pet_Services('01203102');
  newTaskProvider(Pet this.pet);

  void toggleTask(taskName) {
    //print(pet.name);
    bool initialVal = pet.tasks[taskName];
    print("initial value" + initialVal.toString());
    if (initialVal == true) {
      print('valueTrue');
      pet.tasks[taskName] = false;
      petService.setPet("01203102", pet);
      //return false;
    } else {
      print("hello");
      pet.tasks[taskName] = true;
      petService.setPet("01203102", pet);
      //return true;
    }
    //print(initialVal);
  }
}
