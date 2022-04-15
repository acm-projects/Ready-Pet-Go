import 'package:flutter/material.dart';
import 'dart:math';

import '../../back-end/models/pet.dart';
import 'pet_or_play_screen.dart';

class PettingScreen extends StatefulWidget {
  final String userID;
  final Pet pet;
  const PettingScreen(this.pet, this.userID, {Key? key}) : super(key: key);

  @override
  State<PettingScreen> createState() => _PettingPageState();
}

class _PettingPageState extends State<PettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  double top = 120;
  double left = 120;
  String text = 'Drag the hand to pet your pet';
  bool setPos = false;
  String image = "assets/images/e69f6fd7c61b7fca781861df8b44a3c877d16753.png";
  bool acceptedData = false;

  var happyPet = [
    'Awwww, your pet looks happy!!!',
    'Your pet is loving it!!!',
    'Don\'t stop petting!!!',
    'You are giving your pet the zoomies!!!',
    'You are such a great petter!!!'
  ];

  String getRandText() {
    var random = Random();
    int index = random.nextInt(happyPet.length);
    return happyPet[index];
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
              //elevation: 0,
              centerTitle: true,
              title: const Text(
                'PETTING TIME',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                ),
              ),
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
                tooltip: 'Menu',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              PetOrPlayScreen(widget.pet, widget.userID))));
                },
              ),
            ),
            body: Center(
                child: Container(
                    width: sWidth,
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
                                padding: EdgeInsets.symmetric(vertical: 20),
                              ),
                              Draggable<bool>(
                                // Data is the value this Draggable stores.
                                data: true,
                                feedback: Container(
                                  child: ClipRRect(
                                    child: Container(
                                      width: 100,
                                      height: 54,
                                      child: Image.asset(
                                        "assets/images/Hand.png",
                                        color: null,
                                        fit: BoxFit.cover,
                                        colorBlendMode: BlendMode.dstATop,
                                      ),
                                    ),
                                  ),
                                ),
                                childWhenDragging: Container(
                                  height: 54,
                                  width: 100,
                                ),
                                maxSimultaneousDrags: 1,
                                child: Container(
                                  child: ClipRRect(
                                    child: Container(
                                      width: 100,
                                      height: 54,
                                      child: Image.asset(
                                        "assets/images/Hand.png",
                                        color: null,
                                        fit: BoxFit.cover,
                                        colorBlendMode: BlendMode.dstATop,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //const Padding(padding: EdgeInsets.symmetric(vertical: 10),),

                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 60),
                              ),

                              DragTarget<bool>(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                ) {
                                  return Container(
                                    child: ClipRRect(
                                      child: Container(
                                        width: 240,
                                        height: 329,
                                        child: Visibility(
                                          child: Image.asset(
                                            image,
                                            color: null,
                                            //fit: BoxFit.cover,
                                            colorBlendMode: BlendMode.dstATop,
                                          ),
                                          visible: true,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                onAccept: (bool data) {
                                  setState(() {
                                    acceptedData = data;
                                    if (acceptedData) {
                                      image = "assets/images/HappyDog.png";
                                      text = getRandText();
                                    }
                                  });
                                },
                              ),
                            ])
                      ],
                    )))));
  }
}
