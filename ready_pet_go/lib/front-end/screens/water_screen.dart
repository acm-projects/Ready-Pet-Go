import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../back-end/provider_functions/task_provider.dart';
import './home_screen.dart';

import '../../back-end/models/pet.dart';

class WaterScreen extends StatefulWidget {
  final String userID;
  final Pet pet;
  const WaterScreen(this.pet, this.userID, {Key? key}) : super(key: key);

  @override
  State<WaterScreen> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterScreen> {
  @override
  void initState() {
    super.initState();
  }

  String tapWater = 'assets/images/TapWater.png';
  String bowlState = 'assets/images/DogBowl.png';
  String text = "Tap screen to fill the water bowl";
  bool tapped = false;
  bool started = false;
  bool isFilled = false;
  late Timer _timer;
  int _counter = 6;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (tapped) {
          _counter--;
          if (_counter == 0) {
            text = 'Great job! You filled the water bowl!';
            _timer.cancel();
            isFilled = true;
            tapped = false;
            started = false;
            tapWater = 'assets/images/TapWaterWithCheck.png';
            bowlState = 'assets/images/FilledBowl.png';
          } else if (_counter < 3) {
            text = 'Just wait, it\'s almost done...';
            bowlState = 'assets/images/DogBowlPt2.png';
          } else if(_counter < 5) {
            text = 'It\'s filling up...';
            bowlState = 'assets/images/DogBowlPt1.png';
          }
        } else
          _timer.cancel();
      });
    });
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
            title: Text('WATER TIME',
                style: TextStyle(
                  color: Colors.black,
                  //fontFamily: 'Bold',
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                )
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
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
              width: sWidth,
              height: sHeight,
              color: Colors.white,
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
                    Align(
                      alignment: Alignment(0.0, -0.9),
                      child: Text(
                        text,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                      children: [
                        GestureDetector(
                          onTap: () {
                            started = true;
                            if (isFilled) {
                              tapped = false;
                              tapWater =
                                  'assets/images/TapWaterWithCheck.png';
                            } else if (!tapped && !isFilled) {
                              tapped = true;
                              tapWater = 'assets/images/OnWater.png';
                              TaskProvider taskProvider =
                                  TaskProvider(widget.pet, widget.userID);
                              taskProvider.toggleTask('Water');
                              print("hello");
                            } else {
                              tapped = false;
                              tapWater = 'assets/images/TapWater.png';
                            }
                            print(tapped);
                            startTimer();
                            //Navigator.of(context).pushReplacementNamed('/HomeScreen');
                          },
                          child: Container(
                            child: ClipRRect(
                              child: Container(
                                color: Colors.white,
                                width: 225.0,
                                height: 215.0,
                                child: Image.asset(
                                  tapWater,
                                  color: null,
                                  colorBlendMode: BlendMode.dstATop,
                                  //fit: BoxFit.cover
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ClipRRect(
                            child: Container(
                              width: 150,
                              height: 90,
                              child: Visibility(
                                child: Image.asset(
                                  bowlState,
                                  color: null,
                                  //fit: BoxFit.cover,
                                  colorBlendMode: BlendMode.dstATop,
                                ),
                                visible: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*Align(
                      alignment: Alignment(0.0, -0.3),
                      child: GestureDetector(
                        onTap: (){
                          started = true;
                          if(!tapped) {
                            tapped = true;
                            tapWater = 'assets/images/OnWater.png';
                          }
                          else {
                            tapped = false;
                            tapWater = 'assets/images/TapWater.png';
                          }
                          print(tapped);
                          startTimer();
                          //Navigator.of(context).pushReplacementNamed('/HomeScreen');
                        },
                        child: Container(
                          child: ClipRRect(
                            child: Container(
                              color: Colors.white,
                              width: 175.0,
                              height: 335.0,
                              child: Image.asset(
                                tapWater,
                                color: null,
                                colorBlendMode: BlendMode.dstATop,
                                //fit: BoxFit.cover
                              ),
                            ),
                          ),
                        ),
                      )
                  ),*/

                    /*Align(
                    alignment: Alignment(0.0, 0.4),
                    child: Container(
                      child: ClipRRect(
                        child: Container(
                          width: 150,
                          height: 90,
                          child: Visibility(
                            child: Image.asset(
                              "assets/images/DogBowl.png",
                              color: null,
                              //fit: BoxFit.cover,
                              colorBlendMode: BlendMode.dstATop,
                            ),
                            visible: true,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment(0.0, 0.4),
                    child: Container(
                      child: ClipRRect(
                        child: Container(
                          width: 150,
                          height: 90,
                          child: Visibility(
                            child: Image.asset(
                              "assets/images/DogBowlPt1.png",
                              color: null,
                              //fit: BoxFit.cover,
                              colorBlendMode: BlendMode.dstATop,
                            ),
                            visible: (_counter < 5 && started),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment(0.0, 0.4),
                    child: Container(
                      child: ClipRRect(
                        child: Container(
                          width: 150,
                          height: 90,
                          child: Visibility(
                            child: Image.asset(
                              "assets/images/DogBowlPt2.png",
                              color: null,
                              //fit: BoxFit.cover,
                              colorBlendMode: BlendMode.dstATop,
                            ),
                            visible: (_counter < 3 && started),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment(0.0, 0.4),
                    child: Container(
                      child: ClipRRect(
                        child: Container(
                          width: 150,
                          height: 90,
                          child: Visibility(
                            child: Image.asset(
                              "assets/images/FilledBowl.png",
                              color: null,
                              //fit: BoxFit.cover,
                              colorBlendMode: BlendMode.dstATop,
                            ),
                            visible: isFilled,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /*Align(
                    alignment: Alignment(-0.17, 0.07),
                    child: Visibility(
                      child: Container(
                          width: 15,
                          height: 180,
                          decoration: BoxDecoration(
                              color: Colors.blue
                          )
                      ),
                      visible: (_counter > 0 && tapped)
                    )
                  ),*/

                  Align(
                    alignment: Alignment(0, 0),
                      child: Container(
                        child: Visibility(
                            child: Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 100.0
                            ),
                            visible: isFilled
                        ),
                      )
                  ),*/
                  ]),
            ),
          )),
    );
  }
}
