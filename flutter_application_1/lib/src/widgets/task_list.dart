import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/provider_functions/newTaskProvider.dart';
import 'package:flutter_application_1/src/provider_functions/petProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/pets.dart';

// importing material design library

// Creating a stateful widget to manage
// the state of the app
Future<Pet> bringTestPet(String userId) async {
  final petProvider = PetProvider(userId);
  var fPet = petProvider.getFirstPet(userId);
  return fPet;
}

class HomePage extends StatefulWidget {
  final String userId;
  const HomePage(this.userId, {Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Pet> futurePet;
  @override
  initState() {
    super.initState();
    futurePet = bringTestPet(widget.userId);
  }

// value set to false
  Map _tasks = {};

// App widget tree
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.only(left: 95.0),
              child: Text('Task List'),
            ),
            backgroundColor: const Color(0xFF00A5E0),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_sharp),
              tooltip: 'Menu',
              onPressed: () {},
            ), //IconButton
          ), //AppBar
          body: FutureBuilder<Pet>(
            future: futurePet,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                FirebaseAuth auth = FirebaseAuth.instance;
                var userID = auth.currentUser!.uid;
                final taskProvider = NewTaskProvider(snapshot.data!, userID);
                // print(snapshot.data!.petId.toString());
                Map tasks = snapshot.data!.tasks;
                List<Widget> widgetList = <Widget>[];
                _tasks = {...tasks};
                tasks.forEach((key, value) {
                  widgetList.add(
                    const SizedBox(
                      height: 30,
                    ),
                  );

                  widgetList.add(
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF00A5E0)),
                        //borderRadius: BorderRadius.circular(20),
                      ), //BoxDecoration

                      /** CheckboxListTile Widget **/
                      child: CheckboxListTile(
                        title: Text(key.toString()),
                        //	subtitle: const Text(
                        //'A computer science portal for geeks. Here you will find articles on all the technologies.'),
                        secondary: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                        autofocus: false,
                        //isThreeLine: true,
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
