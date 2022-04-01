import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../main.dart';

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
            localNotifications.show(
                1,
                "No Longer Empty",
                "You filled the water bowl",
                NotificationDetails(
                  android: AndroidNotificationDetails(
                      channel.id,
                      channel.name,
                      //channel.description,
                      color:Colors.blue,
                      playSound: true,
                      icon: '@mipmap/ic_launcher'
                  ),
                )
            );
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
                ]),
          ),
        )
      ),
    );
  }
}