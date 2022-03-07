import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/models/pets.dart';
import 'package:flutter_application_1/src/provider_functions/petProvider.dart';

import 'package:flutter_application_1/src/services/pet_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// this is a state provider for the tasks of the current pet, it will store all of the information on the pet and its tasks
// it is used so that this state can be shared throughout the app, and multiple unecesarry api calls will not be needed

final taskStateProvider = StateProvider<Map>(((ref) {
  final petState = ref.watch(petStateProvider);

  return petState!.tasks;
}));

class TaskProvider with ChangeNotifier {
  final petService = Pet_Services();
  WidgetRef ref; //a widget reference must be passed in to use the provider
  TaskProvider(WidgetRef this.ref);

  //the state can be read in as a map, and these functions will just alter the map accordingly

  int completeTask(String taskName) {
    ref.read(taskStateProvider.notifier).state[taskName] = true;
    return 0;
  }

  int addTask(String taskName) {
    ref
        .read(taskStateProvider.notifier)
        .state
        .putIfAbsent(taskName, () => false);
    return 0;
  }

  int resetTask(String taskName) {
    ref.read(taskStateProvider.notifier).state[taskName] = false;
    return 0;
  }

  int deleteTask(String taskName) {
    ref.read(taskStateProvider.notifier).state.remove(taskName);
    return 0;
  }

  void showTaskList() {
    ref.watch(taskStateProvider).forEach((key, value) {
      print("Task: $key , Completed?:  $value");
    });
  }

  Map returnList() {
    return ref.watch(taskStateProvider);
  }
}
