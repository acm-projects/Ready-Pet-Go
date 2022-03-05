import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/models/pets.dart';

import 'package:flutter_application_1/src/services/pet_services.dart';

class TaskProvider with ChangeNotifier {
  final petService = Pet_Services();
  Pet _pet;

  TaskProvider(this._pet);

  int completeTask(String taskName) {
    _pet.tasks[taskName] = true;
    return 0;
  }

  int addTask(String taskName) {
    _pet.tasks.putIfAbsent(taskName, () => false);
    return 0;
  }

  int resetTask(String taskName) {
    _pet.tasks[taskName] = false;
    return 0;
  }

  int deleteTask(String taskName) {
    _pet.tasks.remove(taskName);
    return 0;
  }
}
