import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/provider_functions/petProvider.dart';
import 'package:flutter_application_1/src/provider_functions/taskProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/pets.dart';
import './taskTester.dart';

class tasksCheckBoxList extends ConsumerWidget {
  const tasksCheckBoxList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pet = ref.watch(petStateProvider);
    Map? taskList = pet?.tasks;

    List<Widget> list = <Widget>[];
    taskList?.forEach((key, keyValue) {
      print("Key $key, Value $keyValue");
      list.add(CheckboxListTile(
        title: Text(key),
        value: keyValue,
        onChanged: (bool? value) => {
          // print("before" + (pet?.tasks[key]).toString()),
          // ref.read(petStateProvider.notifier).state?.tasks[key] = !keyValue!,
          // print(
          //     "after: " + (ref.watch(petStateProvider)?.tasks[key]).toString()),
          print("before" + (pet?.tasks[key]).toString()),
          if (keyValue == true)
            {
              print("before1 : $keyValue : $keyValue :  " +
                  (ref.watch(petStateProvider)?.tasks[key]).toString()),
              ref.read(petStateProvider.notifier).state?.tasks[key] = false,
              print("after:1 " +
                  (ref.watch(petStateProvider)?.tasks[key]).toString()),
            }
          else
            {
              print("before2" +
                  (ref.watch(petStateProvider)?.tasks[key]).toString()),
              ref.read(petStateProvider.notifier).state?.tasks[key] = true,
              print("after:2 " +
                  (ref.watch(petStateProvider)?.tasks[key]).toString()),
            },
          print(value),

          ref.read(petStateProvider.notifier).state?.tasks[key] = value,
          print(
              "after: " + (ref.watch(petStateProvider)?.tasks[key]).toString())
        },
        checkColor: Colors.green,
        activeColor: Colors.black,
      ));
    });
    return Column(
      children: list,
    );
  }
}

class taskCheckList2 extends StatefulWidget {
  const taskCheckList2({Key? key}) : super(key: key);

  @override
  State<taskCheckList2> createState() => _taskCheckList2State();
}

class _taskCheckList2State extends State<taskCheckList2> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Consumer(builder: (context, ref, child) {
      final pet = ref.watch(petStateProvider);
      final t = TaskProvider(ref);
      Map? taskList = t.returnList();
      List<Widget> list = <Widget>[];

      taskList?.forEach((key, keyValue) {
        print("Key $key, Value $keyValue");
        list.add(CheckboxListTile(
            title: Text(key),
            value: keyValue,
            onChanged: (bool? value) => {
                  print("before: "),
                  t.showTaskList(),
                  if (pet?.tasks[key] == true)
                    {
                      t.resetTask(key),
                    }
                  else
                    {
                      t.completeTask(key),
                    },
                  print("after: "),
                  t.showTaskList(),
                }));
      });
      return Column(children: list);
    }));
  }
}
