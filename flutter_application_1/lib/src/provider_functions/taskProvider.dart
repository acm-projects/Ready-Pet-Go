import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/models/pets.dart';
import 'package:flutter_application_1/src/provider_functions/petProvider.dart';
import 'dart:convert';
import 'package:flutter_application_1/src/services/pet_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// this is a state provider for the tasks of the current pet, it will store all of the information on the pet and its tasks
// it is used so that this state can be shared throughout the app, and multiple unecesarry api calls will not be needed

final taskStateProvider = StateNotifierProvider<TaskProvider, Map>(((ref) {
  final petState = ref.watch(petStateProvider);
  if (petState == null) {
    print("petState is null");
    return TaskProvider({});
  } else {
    return TaskProvider(petState.tasks);
  }
}));

@immutable
class TaskProvider extends StateNotifier<Map> {
  final petService = Pet_Services('01203102');
  //WidgetRef ref; //a widget reference must be passed in to use the provider
  TaskProvider(Map? tasks) : super(tasks ?? {});

  //the state can be read in as a map, and these functions will just alter the map accordingly

  int completeTask(String taskName) {
    Map newMap = {...state};
    newMap[taskName] = true;
    state = newMap;

    //ref.read(taskStateProvider.notifier).state[taskName] = true;
    return 0;
  }

  // int addTask(String taskName) {
  //   // ref
  //   //     .read(taskStateProvider.notifier)
  //   //     .state
  //   //     .putIfAbsent(taskName, () => false);
  //   return 0;
  // }

  int resetTask(String taskName) {
    Map newMap = {...state};
    newMap[taskName] = false;
    state = newMap;
    return 0;
  }

  // int deleteTask(String taskName) {
  //   return 0;
  // }

  void showTaskList() {
    state.forEach((key, value) {
      print("Task: $key , Completed?:  $value");
    });
  }

  Map returnList() {
    return state;
  }
}
