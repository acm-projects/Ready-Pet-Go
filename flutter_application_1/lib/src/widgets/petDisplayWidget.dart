import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/provider_functions/petProvider.dart';
import 'package:flutter_application_1/src/widgets/wrapperWidget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../models/pets.dart';

class petDisplays extends ConsumerWidget {
  @override
  Pet? pet;
  final PetProvider _petProvider = PetProvider();

  void makePet() async {
    pet = await _petProvider.getFirstPet("01203102");
  }

  Widget build(BuildContext context, WidgetRef ref) {
    makePet();
    ref.read(petStateProvider.notifier).state = pet;

    return Container(
        child: (() {
      if (pet == null) {
        return Text("loading...");
      } else {
        return Column(children: [
          Text(pet?.name),
          Text(pet?.breed),
          Text(pet?.age),
          Text(pet!.tasks.toString())
        ]);
      }
    }()));
  }
}
