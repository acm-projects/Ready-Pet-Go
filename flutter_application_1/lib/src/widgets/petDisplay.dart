import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/pets.dart';
import 'package:flutter_application_1/src/widgets/task_list.dart';
import '../provider_functions/petProvider.dart';
import '../models/pets.dart';

Future<Pet> bringTestPet(String userId) async {
  final petProvider = PetProvider(userId);
  var fPet = petProvider.getFirstPet();
  return fPet;
}

class PetDisplay extends StatefulWidget {
  final String userId;
   const PetDisplay(this.userId, {Key? key}) : super(key: key);

  @override
  State<PetDisplay> createState() => _PetDisplayState();
}

class _PetDisplayState extends State<PetDisplay> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pet>(
      future: bringTestPet(widget.userId),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(snapshot.data!.name),
              FloatingActionButton(
                onPressed: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => taskListDisplay(widget.userId))));
                }),
                child: const Text('tasks'),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}
