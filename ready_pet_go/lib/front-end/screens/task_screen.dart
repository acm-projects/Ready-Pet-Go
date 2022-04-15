import 'package:flutter/material.dart';
import '../../back-end/provider_functions/task_provider.dart';
import '../../back-end/provider_functions/pet_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './home_screen.dart';
import '../../back-end/models/pet.dart';

// importing material design library

// Creating a stateful widget to manage
// the state of the app
Future<Pet> bringTestPet(String userId) async {
  final petProvider = PetProvider(userId);
  var fPet = petProvider.getFirstPet();
  return fPet;
}

class TaskScreen extends StatefulWidget {
  final String userId;
  final String petName;
  const TaskScreen(this.petName, this.userId, {Key? key}) : super(key: key);
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late Future<Pet> futurePet;
  @override
  initState() {
    super.initState();
    futurePet = bringTestPet(widget.userId);
  }

// value set to false
  Map _tasks = {};

  Map<String, String> images = {
    'Play': "assets/images/temptoy.png",
    'Feed': "assets/images/tempfood2.png",
    'Walk': "assets/images/tempwalk2.png",
    'Water': "assets/images/tempwater2.png",
  };

// App widget tree
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Text('TO-DO LIST',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontSize: 30)),
            ),
            backgroundColor: Colors.white,
            elevation: 3,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_sharp, color: Colors.black),
              tooltip: 'Menu',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => HomeScreen(widget.userId))));
              },
            ), //IconButton
          ), //AppBar
          body: FutureBuilder<Pet>(
            future: futurePet,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                FirebaseAuth auth = FirebaseAuth.instance;
                var userID = auth.currentUser!.uid;
                final taskProvider = TaskProvider(snapshot.data!, userID);
                // print(snapshot.data!.petId.toString());
                Map? tasks = snapshot.data!.tasks;
                List<Widget> widgetList = <Widget>[];
                _tasks = {...?tasks};
                tasks!.forEach((key, value) {
                  widgetList.add(
                    const SizedBox(
                      height: 30,
                    ),
                  );

                  String text = "";
                  String petName = widget.petName;
                  if (key == 'Walk') {
                    text = "Take $petName on a walk";
                  } else if (key == 'Water') {
                    text = "Give $petName some water";
                  } else if (key == 'Feed') {
                    text = "Feed $petName";
                  } else {
                    text = "Play with $petName";
                  }

                  widgetList.add(
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF00A5E0)),
                        //borderRadius: BorderRadius.circular(20),
                      ), //BoxDecoration

                      /** CheckboxListTile Widget **/
                      child: CheckboxListTile(
                        title: Text(text,
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700)),
                        //	subtitle: const Text(
                        //'A computer science portal for geeks. Here you will find articles on all the technologies.'),
                        secondary: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          backgroundImage: AssetImage(
                            images[key].toString(),
                          ),
                        ),

                        autofocus: false,
                        activeColor: Colors.white,
                        checkColor: const Color(0xFF82B26C),
                        selectedTileColor: const Color(0xFF82B26C),
                        selected: _tasks[key],
                        value: _tasks[key],

                        onChanged: (value) {
                          setState(() {
                            _tasks[key] = value!;
                            taskProvider.toggleTask(key);
                          });
                        },
                      ), //CheckboxListTile
                    ),
                  );
                });
                //_value = snapshot.data!.tasks['Feed Dog'];
                return (Center(
                  child: SizedBox(
                    width: 800,
                    height: 800,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: widgetList,
                        ), //Container
                      ), //Padding
                    ), //Center
                  ),
                ));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ) //SizedBox
          ),
      debugShowCheckedModeBanner: false, //Scaffold
    ); //MaterialApp
  }
}

/**
 *  const SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xFF00A5E0)),
                                //borderRadius: BorderRadius.circular(20),
                              ), //BoxDecoration

                              /** CheckboxListTile Widget **/
                              child: CheckboxListTile(
                                title: const Text('Feed Buddy Breakfast'),
                                //	subtitle: const Text(
                                //'A computer science portal for geeks. Here you will find articles on all the technologies.'),
                                secondary: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  //backgroundImage:
                                  //backgroundColor: Colors.white,
                                  //(Icons.calculate, size: 55),
                                  // backgroundImage:
                                  //     AssetImage('assets/images/dog_food.png'),
                                  //NetworkImage(
                                  //	"https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetworkImage
                                  radius: 20,
                                ),
                                autofocus: false,
                                //isThreeLine: true,
                                activeColor: Colors.white,
                                checkColor: Color(0xFF82B26C),
                                selectedTileColor: Color(0xFF82B26C),
                                selected: _value,
                                value: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value!;
                                    taskProvider.toggleTask('Feed dog');
                                  });
                                },
                              ), //CheckboxListTile
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF00A5E0)),
                                //borderRadius: BorderRadius.circular(20),
                              ), //BoxDecoration

                              child: CheckboxListTile(
                                title: const Text('Take Buddy on a Walk'),
                                secondary: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  // backgroundImage: AssetImage(
                                  //     'assets/images/dog_walk.png'), //NetworkImage
                                  radius: 20,
                                ),
                                autofocus: false,
                                activeColor: Colors.white,
                                checkColor: Color(0xFF82B26C),
                                selectedTileColor: Color(0xFF82B26C),
                                selected: _value2,
                                value: _value2,
                                onChanged: (value) {
                                  setState(() {
                                    _value2 = value!;
                                  });
                                },
                              ), //CheckboxListTile
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF00A5E0)),
                                //borderRadius: BorderRadius.circular(20),
                              ), //BoxDecoration

                              child: CheckboxListTile(
                                title: const Text('Play with Buddy'),
                                secondary: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  // backgroundImage: AssetImage(
                                  //     'assets/images/dog_toy.png'), //NetworkImage
                                  radius: 20,
                                ),
                                autofocus: false,
                                activeColor: Colors.white,
                                checkColor: Color(0xFF82B26C),
                                selectedTileColor: Color(0xFF82B26C),
                                selected: _value3,
                                value: _value3,
                                onChanged: (value) {
                                  setState(() {
                                    _value3 = value!;
                                  });
                                },
                              ), //CheckboxListTile
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF00A5E0)),
                                //borderRadius: BorderRadius.circular(20),
                              ), //BoxDecoration

                              child: CheckboxListTile(
                                title: const Text('Feed Buddy Lunch'),
                                secondary: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  // backgroundImage: AssetImage(
                                  //     'assets/images/dog_food.png'), //NetworkImage
                                  radius: 20,
                                ),
                                autofocus: false,
                                activeColor: Colors.white,
                                checkColor: Color(0xFF82B26C),
                                selectedTileColor: Color(0xFF82B26C),
                                selected: _value4,
                                value: _value4,
                                onChanged: (value) {
                                  setState(() {
                                    _value4 = value!;
                                  });
                                },
                              ), //CheckboxListTile
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF00A5E0)),
                                //borderRadius: BorderRadius.circular(20),
                              ), //BoxDecoration

                              child: CheckboxListTile(
                                title: const Text('Feed Buddy Dinner'),
                                secondary: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  // backgroundImage: AssetImage(
                                  //     'assets/images/dog_food.png'), //NetworkImage
                                  radius: 20,
                                ),
                                autofocus: false,
                                activeColor: Colors.white,
                                checkColor: Color(0xFF82B26C),
                                selectedTileColor: Color(0xFF82B26C),
                                selected: _value5,
                                value: _value5,
                                onChanged: (value) {
                                  setState(() {
                                    _value5 = value!;
                                  });
                                },
                              ), //CheckboxListTile
                            ),
 */
