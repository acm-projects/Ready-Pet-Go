import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WaterScreen extends StatefulWidget{
  const WaterScreen({Key? key}) : super(key: key);

  @override
  State<WaterScreen> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterScreen>{
  @override
  void initState()
  {
    super.initState();
  }

  String tapWater = 'assets/images/TapWater.png';
  String bowlState = 'assets/images/DogBowl.png';
  bool tapped = false;
  bool started = false;
  bool isFilled = false;
  late Timer _timer;
  int _counter = 6;

  void startTimer(){
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(tapped) {
          _counter--;
          if (_counter == 0) {
            _timer.cancel();
            isFilled = true;
            tapped = false;
            started = false;
            tapWater = 'assets/images/TapWaterWithCheck.png';
            bowlState = 'assets/images/FilledBowl.png';
          } else if (_counter < 3) {
            bowlState = 'assets/images/DogBowlPt2.png';
          } else if(_counter < 5) {
            bowlState = 'assets/images/DogBowlPt1.png';
          }
        }
        else
          _timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context){
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 85.0),
            child: Text('Water Time'),
          ),
          backgroundColor: Color(0xFF00A5E0),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            tooltip: 'Menu',
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/HomeScreen');
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
                      '''Tap the screen to give the dog water''',
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.171875,
                        fontSize: 25.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 0, 0, 0),

                        /* letterSpacing: 0.0, */
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          started = true;
                          if(isFilled) {
                            tapped = false;
                            tapWater = 'assets/images/TapWaterWithCheck.png';
                          }
                          else if(!tapped && !isFilled) {
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
        )
      ),
    );
  }
}