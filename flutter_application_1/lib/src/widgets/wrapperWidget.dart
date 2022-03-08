import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/pets.dart';
import 'package:flutter_application_1/src/provider_functions/petProvider.dart';
import 'package:flutter_application_1/src/widgets/petCreationWidget.dart';
import 'package:flutter_application_1/src/widgets/petDisplayWidget.dart';
import 'package:flutter_application_1/src/widgets/taksCheckBoxWidget.dart';
import 'package:flutter_application_1/src/widgets/taskTester.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Pet? _pet;

class wrapperWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final petState = ref.watch(petStateProvider);
    print(petState.toString());
    return Column(children: [
      petCreator(),
      FloatingActionButton(
          onPressed: () => {
                //print(ref.read(petStateProvider.notifier).state?.name)
              }),
      taskCheckList2()
    ]);
  }
}
