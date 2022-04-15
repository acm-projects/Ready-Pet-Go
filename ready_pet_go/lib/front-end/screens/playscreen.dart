import 'package:flutter/material.dart';
import 'dart:math';

import '../../back-end/models/pet.dart';
import 'pet_or_play_screen.dart';

class PlayingScreen extends StatefulWidget {
  final Pet pet;
  final String userID;
  const PlayingScreen(this.pet, this.userID, {Key? key}) : super(key: key);

  @override
  State<PlayingScreen> createState() => _PlayingPage();
}

class _PlayingPage extends State<PlayingScreen> {
  @override
  void initState() {
    super.initState();
  }

  double top = 120;
  double left = 120;
  String text = 'Drag a toy to your pet';
  String toy = '';
  bool setPos = false;
  String image = "assets/images/e69f6fd7c61b7fca781861df8b44a3c877d16753.png";
  bool acceptedData = false;

  var happyPet = [
    'Awwww, your pet looks happy!!!',
    'Your pet is loving it!!!',
    'Your pet is having fun!',
    'Your pet is getting zoomies!!!',
    'Woohoo!!!'
  ];

  String getRandText() {
    var random = Random();
    int index = random.nextInt(happyPet.length + 1);
    if (index == happyPet.length) {
      return 'You and your pet played with a ' + toy + '!';
    } else {
      return happyPet[index];
    }
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
              title: const Text(
                'PLAY TIME',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 28.0,
                    color: Colors.black
                ),
              ),
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_sharp, color: Colors.black),
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
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Draggable<String>(
                                      // Data is the value this Draggable stores.
                                      data: 'rope',
                                      feedback: Container(
                                        child: ClipRRect(
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            child: Image.asset(
                                              "assets/images/Toy.png",
                                              color: null,
                                              fit: BoxFit.cover,
                                              colorBlendMode: BlendMode.dstATop,
                                            ),
                                          ),
                                        ),
                                      ),
                                      childWhenDragging: Container(
                                        height: 100,
                                        width: 100,
                                      ),
                                      maxSimultaneousDrags: 1,
                                      child: Container(
                                        child: ClipRRect(
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            child: Image.asset(
                                              "assets/images/Toy.png",
                                              color: null,
                                              fit: BoxFit.cover,
                                              colorBlendMode: BlendMode.dstATop,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Draggable<String>(
                                      // Data is the value this Draggable stores.
                                      data: 'ball',
                                      feedback: Container(
                                        child: ClipRRect(
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            child: Image.asset(
                                              "assets/images/Ball.png",
                                              color: null,
                                              fit: BoxFit.cover,
                                              colorBlendMode: BlendMode.dstATop,
                                            ),
                                          ),
                                        ),
                                      ),
                                      childWhenDragging: Container(
                                        height: 100,
                                        width: 100,
                                      ),
                                      maxSimultaneousDrags: 1,
                                      child: Container(
                                        child: ClipRRect(
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            child: Image.asset(
                                              "assets/images/Ball.png",
                                              color: null,
                                              fit: BoxFit.cover,
                                              colorBlendMode: BlendMode.dstATop,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 60),
                              ),
                              DragTarget<String>(
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
                                onAccept: (String data) {
                                  setState(() {
                                    toy = data;
                                    image = "assets/images/HappyDog.png";
                                    text = getRandText();
                                  });
                                },
                              ),
                            ])
                      ],
                    )))));
  }
}
