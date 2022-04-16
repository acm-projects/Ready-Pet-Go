import 'dart:async';

import 'package:flutter/material.dart';
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
  String tapWater = 'assets/images/TapWater.png';
  String bowlState = 'assets/images/DogBowl.png';
  String text = "Tap the screen to fill ";
  String name = "";
  bool tapped = false;
  bool started = false;
  bool isFilled = false;
  late Timer _timer;
  int _counter = 6;

  @override
  void initState() {
    String? pet = widget.pet.name;
    if(pet == null)
    {
      name = 'the water bowl';
    }
    else
    {
      name = pet + '\'s water bowl';
    }
    text += name;
    super.initState();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (tapped) {
          _counter--;
          if (_counter == 0) {
            text = 'Great job! You filled ' + name;
            _timer.cancel();
            isFilled = true;
            tapped = false;
            started = false;
            tapWater = 'assets/images/TapWaterWithCheck.png';
            bowlState = 'assets/images/FilledBowl.png';
          } else if (_counter < 3) {
            text = 'Just wait, it\'s almost done...';
            bowlState = 'assets/images/DogBowlPt2.png';
          } else if (_counter < 5) {
            text = 'It\'s filling up...';
            bowlState = 'assets/images/DogBowlPt1.png';
          }
        } else {
          _timer.cancel();
        }
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
            title: const Text('WATER TIME',
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
                      children: [
                        GestureDetector(
                          onTap: () {
                            started = true;
                            if (isFilled) {
                              tapped = false;
                              tapWater = 'assets/images/TapWaterWithCheck.png';
                            } else if (!tapped && !isFilled) {
                              tapped = true;
                              tapWater = 'assets/images/OnWater.png';
                              TaskProvider taskProvider =
                                  TaskProvider(widget.pet, widget.userID);
                              taskProvider.toggleTask('Water');
                              //print("hello");
                            } else {
                              tapped = false;
                              tapWater = 'assets/images/TapWater.png';
                            }
                            //print(tapped);
                            startTimer();
                            //Navigator.of(context).pushReplacementNamed('/HomeScreen');
                          },
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
                        ClipRRect(
                          child: SizedBox(
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
                      ],
                    ),
                  ]),
            ),
          )),
    );
  }
}
