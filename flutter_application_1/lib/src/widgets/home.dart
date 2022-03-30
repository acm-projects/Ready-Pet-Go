import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/src/pages/FoodScreen/feeding_screen.dart';
import 'package:flutter_application_1/src/pages/WalkScreens/walking_tracker_screen.dart';
import 'package:flutter_application_1/src/pages/WaterScreen/water_screen.dart';
import 'package:flutter_application_1/src/pages/pet_or_play_screen.dart';
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
  debugPrint(pet.name + " home page dog name");
  return pet.name;
}

Future<Pet> bringTestPet(String userId) async {
  final petProvider = PetProvider(userId);
  var fPet = await petProvider.getFirstPet();
  return fPet;
}

class Home extends StatefulWidget {
  final String userID;
  const Home(this.userID, {Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String petName = "";
  late Pet pet;
  void getPetName() {
    getPetNameFromDatabase(widget.userID).then((value) => setState(() {
          petName = value!;
        }));
    bringTestPet(widget.userID).then((value) => setState(() {
          pet = value;
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
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    String name = pet.name;
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 85.0),
            child: Text('Home Screen'),
          ),
          backgroundColor: Color(0xFF00A5E0),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            tooltip: 'Log Out ',
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/HomeScreen');
            },
          ),
        ),
        body: Center(
          child: Container(
            width: sWidth,
            height: sHeight,
            child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.zero,
                    child: Container(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Column(children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //const Padding(padding: EdgeInsets.symmetric(vertical: 90),),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        OptionPage(widget.userID))));
                          },
                          child: PlayIcon(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        WaterScreen(widget.userID))));
                          },
                          child: WaterIcon(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        FeedingScreen(pet, widget.userID))));
                          },
                          child: FoodIcon(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        TrackerScreen(widget.userID))));
                          },
                          child: WalkIcon(),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 45),
                    ),
                    PetImage(),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                    ),
                    Text(
                      '''$petName''',
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        height: 1.171875,
                        fontSize: 48.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 0, 0, 0),

                        /* letterSpacing: 0.0, */
                      ),
                    ),
                    //const Padding(padding: EdgeInsets.symmetric(vertical: 5),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => taskListDisplay(
                                        petName, widget.userID))));
                          },
                          child: ListIcon(),
                        ),
                      ],
                    )
                  ]),
                ]),
          ),
        ));
  }
}
