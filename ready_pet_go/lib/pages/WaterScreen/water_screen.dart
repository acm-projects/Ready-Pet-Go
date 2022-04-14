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
  String text = "Tap screen to fill the water bowl";
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
            text = 'Great job! You filled the water bowl!';
            _timer.cancel();
            isFilled = true;
            tapped = false;
            started = false;
            tapWater = 'assets/images/TapWaterWithCheck.png';
            bowlState = 'assets/images/FilledBowl.png';
            /*localNotifications.show(
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
                      icon: '@mipmap/launcher_icon'
                  ),
                )
            );*/
          } else if (_counter < 3) {
            text = 'Just wait, it\'s almost done...';
            bowlState = 'assets/images/DogBowlPt2.png';
          } else if(_counter < 5) {
            text = 'It\'s filling up...';
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
          //elevation: 0.5,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp,
            color: Colors.black),
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