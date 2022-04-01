import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ready_pet_go/main.dart';

class TrackerScreen extends StatefulWidget{
  const TrackerScreen({Key? key}) : super(key: key);

  @override
  State<TrackerScreen> createState() => _TrackingState();
}

class _TrackingState extends State<TrackerScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool setPos = false;
  double top = 120;
  double left = 140;
  String image = "assets/images/e69f6fd7c61b7fca781861df8b44a3c877d16753.png";
  bool acceptedData = false;
  Widget build(BuildContext context){
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 85.0),
                child: Text('Options'),
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

                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            SizedBox(
                              width: 240,
                              height: 80,
                              child: CupertinoButton(
                                  color: Colors.lightBlue,
                                  child: Text(
                                    "Pet the Dog",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: 1.171875,
                                      fontSize: 20.0,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 255, 255, 255),

                                      /* letterSpacing: 0.0, */
                                    ),
                                  ),
                                  onPressed: (){
                                    localNotifications.show(
                                        0,
                                        "Dog Interaction",
                                        "You chose to pet your doggy",
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
                                  }
                              ),
                            ),
                            const Padding(padding: EdgeInsets.symmetric(vertical: 60),),
                            SizedBox(
                                width: 240,
                                height: 80,
                                child: CupertinoButton(
                                    color: Colors.green,
                                    child: Text(
                                      "Play with the Dog",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        height: 1.171875,
                                        fontSize: 20.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 255, 255, 255),

                                        /* letterSpacing: 0.0, */
                                      ),
                                    ),
                                    onPressed: (){
                                      localNotifications.show(
                                          1,
                                          "Dog Interaction",
                                          "You chose to play with doggy",
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
                                    }
                                )
                            ),
                          ]
                      ),
                    ]),
              ),
            )
        )
    );
  }
}