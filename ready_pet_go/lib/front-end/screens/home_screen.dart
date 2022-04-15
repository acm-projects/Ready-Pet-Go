import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ready_pet_go/front-end/screens/start_walk_screen.dart';

import './feed_screen.dart';
import './water_screen.dart';
import './pet_or_play_screen.dart';
import './finished_task_screen.dart';

import './login_screen.dart';
import './task_screen.dart';
import '../../back-end/models/pet.dart';

import '../../back-end/provider_functions/pet_provider.dart';

import '../icon_widgets/food_icon.dart';
import '../icon_widgets/list_icon.dart';
import '../icon_widgets/pet_icon.dart';
import '../icon_widgets/play_icon.dart';
import '../icon_widgets/walk_icon.dart';
import '../icon_widgets/water_icon.dart';

Future<String?> getPetNameFromDatabase(String userID) async {
  final petProvider = PetProvider(userID);
  Pet pet = await petProvider.getFirstPet();
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
            centerTitle: true,
            title: const Text(
              'Ready, Pet, GO!',
              style: TextStyle(
                fontFamily: 'Chewy',
                color: Colors.black,
                //fontWeight: FontWeight.w200,
                fontSize: 28,
                //fontStyle: FontStyle.italic,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.question_mark_rounded,
                    color: Colors.black),
                tooltip: 'Instructions',
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      'Help Guide',
                      style: TextStyle(
                        //height: 1.171875,
                        //fontSize: 48.0,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 0, 0, 0),

                        /* letterSpacing: 0.0, */
                      ),
                    ),
                    content: const Text(
                      '1. Click on the icons in the top row to do certain tasks.\n\n'
                      '2. Click on the list icon in the bottom left to check your to-do list.\n\n'
                      '3. Do these tasks daily and take great care of your pet.\n\n'
                      'Have fun!',
                      style: TextStyle(
                        //height: 1.171875,
                        //fontSize: 48.0,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 0, 0, 0),

                        /* letterSpacing: 0.0, */
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            //height: 1.171875,
                            //fontSize: 48.0,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF00A5E0),

                            /* letterSpacing: 0.0, */
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.black),
                tooltip: 'Log Out',
                onPressed: () {
                  _signOut().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const LoginScreen()))));
                },
              ),
            ]),
        // leading: IconButton(
        //   icon: Icon(Icons.logout_sharp),
        //   tooltip: 'Log Out ', //IMPLEMENT PLEASE
        //   onPressed: () {
        //     _signOut().then((value) => Navigator.push(context,
        //         MaterialPageRoute(builder: ((context) => LoginScreen()))));
        //   },
        // ),

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
                                            builder: ((context) =>
                                                PetOrPlayScreen(
                                                    pet, widget.userID))));
                                  },
                                  child: PlayIcon(),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (pet.tasks!['Water']) {
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
                                    if (pet.tasks!['Feed']) {
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
                                              builder: ((context) => FeedScreen(
                                                  pet, widget.userID))));
                                    }
                                  },
                                  child: const FoodIcon(),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (pet.tasks!['Walk']) {
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
                                                  StartWalkScreen(
                                                      pet, widget.userID))));
                                    }
                                  },
                                  child: WalkIcon(),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 45),
                            ),
                            const PetIcon(),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                            ),
                            Text(
                              '''$petName''',
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                height: 1.171875,
                                fontSize: 48.0,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700,
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
                                            builder: ((context) => TaskScreen(
                                                petName!, widget.userID))));
                                  },
                                  child: ListIcon(),
                                ),
                              ],
                            )
                          ]);
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                ]),
          ),
        ));
  }
}
