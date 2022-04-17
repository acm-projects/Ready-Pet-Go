import 'package:flutter/material.dart';
import 'package:ready_pet_go/back-end/provider_functions/task_provider.dart';
import './home_screen.dart';

import '../../back-end/models/pet.dart';

class FeedScreen extends StatefulWidget {
  final String userID;
  final Pet pet;
  const FeedScreen(this.pet, this.userID, {Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedingPageState();
}

class _FeedingPageState extends State<FeedScreen> {
  bool acceptedData = false;
  String bowl = 'assets/images/DogBowl.png';
  String text = 'Drag the food to ';
  String name = "";
  String? pet;

  @override
  void initState() {
    pet = widget.pet.name;
    if(pet == null)
    {
      name = 'the bowl.';
    }
    else
    {
      name = pet! + '\'s bowl.';
    }
    text += name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Nunito'),
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('FOOD TIME',
                  style: TextStyle(
                    color: Colors.black,
                    //fontFamily: 'Bold',
                    fontSize: 28.0,
                    fontWeight: FontWeight.w900,
                  )),
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_sharp, color: Colors.black),
                tooltip: 'Menu',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => HomeScreen(widget.userID))));
                },
              ),
            ),
            body: Center(
                child: Container(
                    width: sWidth - 30,
                    height: sHeight,
                    color: Colors.white,
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: const Alignment(0.0, -0.9),
                          child: Text(
                            text,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              height: 1.171875,
                              fontSize: 25.0,
                              //fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 0, 0, 0),

                              /* letterSpacing: 0.0, */
                            ),
                          ),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 50),
                              ),
                              Draggable<bool>(
                                // Data is the value this Draggable stores.
                                data: true,
                                feedback: ClipRRect(
                                  child: SizedBox(
                                    width: 80,
                                    height: 100,
                                    child: Image.asset(
                                      "assets/images/DogFood.png",
                                      color: null,
                                      fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.dstATop,
                                    ),
                                  ),
                                ),
                                childWhenDragging: const SizedBox(
                                  height: 100.0,
                                  width: 100.0,
                                ),
                                maxSimultaneousDrags: (acceptedData) ? 0 : 1,
                                child: ClipRRect(
                                  child: SizedBox(
                                    width: 80,
                                    height: 100,
                                    child: Image.asset(
                                      "assets/images/DogFood.png",
                                      color: null,
                                      fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.dstATop,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                width: 300,
                                height: 30,
                                child: Image.asset(
                                  "assets/images/Shelf.png",
                                  color: null,
                                  fit: BoxFit.cover,
                                  width: 500,
                                  height: 50,
                                  colorBlendMode: BlendMode.dstATop,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 30),
                              ),
                              Visibility(
                                  child: const SizedBox(
                                    width: 110,
                                    height: 110,
                                  ),
                                  visible: !acceptedData),
                              Visibility(
                                  child: const Icon(Icons.check,
                                      color: Color(0xff82B26C), size: 110.0),
                                  visible: acceptedData),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 30),
                              ),
                              DragTarget<bool>(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                ) {
                                  return ClipRRect(
                                    child: SizedBox(
                                      width: 150,
                                      height: 90,
                                      child: Visibility(
                                        child: Image.asset(
                                          bowl,
                                          color: null,
                                          //fit: BoxFit.cover,
                                          colorBlendMode: BlendMode.dstATop,
                                        ),
                                        visible: true,
                                      ),
                                    ),
                                  );
                                },
                                onAccept: (bool data) {
                                  setState(() {
                                    acceptedData = data;
                                    if (acceptedData) {
                                      var taskProvider = TaskProvider(
                                          widget.pet, widget.userID);
                                      taskProvider.toggleTask('Feed');
                                      bowl = 'assets/images/FoodBowl.png';
                                      if(pet != null) {
                                        text = pet! + ', food is ready!';
                                      }
                                      else{
                                        text = 'Food is ready!';
                                      }
                                    }
                                  });
                                },
                              ),
                            ])
                      ],
                    ))),
            backgroundColor: Colors.white,
        ));
  }
}
