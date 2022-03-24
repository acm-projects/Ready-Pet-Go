import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/src/widgets/task_list.dart';
import '../services/pet_services.dart';
import '../models/pets.dart';

import '../provider_functions/petProvider.dart';

import '../icon_widgets/food_icon.dart';
import '../icon_widgets/list_icon.dart';
import '../icon_widgets/pet_screen.dart';
import '../icon_widgets/play_icon.dart';
import '../icon_widgets/walk_icon.dart';
import '../icon_widgets/water_icon.dart';

// Future<Pet> getPetName(String userID) async {
//   final petService = PetServices(userID);
//   Stream<List<Pet>> petStream = petService.getPets();
//   List<Pet> petList = petStream.first;
//   return petList[0];
// }
Future<String?> getPetNameFromDatabase(String userID) async {
  final petProvider = PetProvider(userID);
  Pet pet = await petProvider.getFirstPet();
  debugPrint(pet.name! + " home page dog name");
  return pet.name;
}

class Home extends StatefulWidget {
  final String userID;
  const Home(this.userID, {Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String petName = "";
  void getPetName() {
    getPetNameFromDatabase(widget.userID).then((value) => setState(() {
          petName = value!;
        }));
  }

  @override
  void initState() {
    super.initState();
    getPetName();
  }

  // late Pet pet = petServices.getPet();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 375.0,
        height: 812.0,
        child:
            Stack(fit: StackFit.expand, alignment: Alignment.center, children: [
          ClipRRect(
            borderRadius: BorderRadius.zero,
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.65),
            child: Text(
              // getPetName(widget.userID).then((value) => string = value),
              petName,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.left,
              style: const TextStyle(
                height: 1.171875,
                fontSize: 48.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 0, 0, 0),

                /* letterSpacing: 0.0, */
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.75, -0.75),
            child: GestureDetector(
              onTap: () => print('Tapped'),
              child: PlayIcon(),
            ),
          ),
          Align(
            alignment: Alignment(-0.25, -0.75),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/WaterScreen');
              },
              child: WaterIcon(),
            ),
          ),
          Align(
            alignment: Alignment(0.25, -0.75),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/WaterScreen');
              },
              child: FoodIcon(),
            ),
          ),
          Align(
            alignment: Alignment(0.75, -0.75),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/WaterScreen');
              },
              child: WalkIcon(),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.0),
            child: PetImage(),
          ),
          Align(
            alignment: Alignment(-0.95, 0.95),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,  MaterialPageRoute(
                          builder: ((context) => taskListDisplay(widget.userID))));
              },
              child: ListIcon(),
            ),
          )
        ]),
      ),
    );
  }
}
