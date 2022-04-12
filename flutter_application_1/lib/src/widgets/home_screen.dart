import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/src/widgets/feed_screen.dart';
import 'package:flutter_application_1/src/widgets/walking_tracker_screen.dart';
import 'package:flutter_application_1/src/widgets/water_screen.dart';
import 'package:flutter_application_1/src/widgets/pet_or_play_screen.dart';
import 'package:flutter_application_1/src/widgets/finished_task_screen.dart';
import 'package:flutter_application_1/src/widgets/loading_screen.dart';

import 'package:flutter_application_1/src/widgets/login_screen.dart';
import 'package:flutter_application_1/src/widgets/task_screen.dart';
import '../services/pet_services.dart';
import '../models/pets.dart';

import '../provider_functions/pet_provider.dart';

import '../icon_widgets/food_icon.dart';
import '../icon_widgets/list_icon.dart';
import '../icon_widgets/pet_icon.dart';
import '../icon_widgets/play_icon.dart';
import '../icon_widgets/walk_icon.dart';
import '../icon_widgets/water_icon.dart';

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

class HomeScreen extends StatefulWidget {
  final String userID;
  const HomeScreen(this.userID, {Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<void> _signOut() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  await auth.signOut();
}

class _HomeScreenState extends State<HomeScreen> {
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
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 85.0),
            child: Text('Home Screen'),
          ),
          backgroundColor: Color(0xFF00A5E0),
          leading: IconButton(
            icon: Icon(Icons.logout_sharp),
            tooltip: 'Log Out ', //IMPLEMENT PLEASE
            onPressed: () {
              _signOut().then((value) => Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => LoginScreen()))));
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
                  FutureBuilder<Pet>(
                      future: bringTestPet(widget.userID),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var petName = snapshot.data!.name;
                          var pet = snapshot.data!;

                          return Column(children: [
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
                                            builder: ((context) => PetOrPlayScreen(
                                                pet, widget.userID))));
                                  },
                                  child: PlayIcon(),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (pet.tasks['Water']) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  FinishedTaskScreen(
                                                      widget.userID))));
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  WaterScreen(
                                                      pet, widget.userID))));
                                    }
                                  },
                                  child: WaterIcon(),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (pet.tasks['Feed']) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  FinishedTaskScreen(
                                                      widget.userID))));
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  FeedScreen(
                                                      pet, widget.userID))));
                                    }
                                  },
                                  child: FoodIcon(),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (pet.tasks['Walk']) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  FinishedTaskScreen(
                                                      widget.userID))));
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  TrackerScreen(
                                                      widget.userID))));
                                    }
                                  },
                                  child: WalkIcon(),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 45),
                            ),
                            PetIcon(),
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
                                            builder: ((context) =>
                                                TaskScreen(
                                                    petName, widget.userID))));
                                  },
                                  child: ListIcon(),
                                ),
                              ],
                            )
                          ]);
                        } else {
                          return LoadingScreen();
                        }
                      }),
                ]),
          ),
        ));
  }
}
