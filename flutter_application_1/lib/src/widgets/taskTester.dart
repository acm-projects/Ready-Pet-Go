import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/pets.dart';
import 'package:flutter_application_1/src/provider_functions/petProvider.dart';
import 'package:flutter_application_1/src/services/pet_services.dart';
import 'package:flutter_application_1/src/widgets/taksCheckBoxWidget.dart';
import 'package:flutter_application_1/src/widgets/wrapperWidget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import '../services/pet_services.dart';

class taskTester extends StatefulWidget {
  WidgetRef ref;
  taskTester(WidgetRef this.ref, {Key? key}) : super(key: key);

  @override
  State<taskTester> createState() => _taskTesterState();
}

Future<Pet> bringTestPet(WidgetRef ref) async {
  final petProvider = PetProvider();
  var fPet =
      petProvider.getPet("01203102", "e7f98e69-a52d-4b39-8a8a-c8cfc0febd56");
  ref.read(petStateProvider.notifier).state = await fPet;
  print('hi');
  return fPet;
}

class _taskTesterState extends State<taskTester> {
  static bool debugRethrowError = false;
  late Future<Pet> futurePet = bringTestPet(widget.ref);
  @override
  void initState() {
    super.initState();
    futurePet = bringTestPet(widget.ref);
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<Pet>(
            future: futurePet,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [Text(snapshot.data!.name), taskCheckList2()],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            }),
      ],
    );
  }
}
