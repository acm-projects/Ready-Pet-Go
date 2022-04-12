import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeedingScreen extends StatefulWidget{
  const FeedingScreen({Key? key}) : super(key: key);

  @override
  State<FeedingScreen> createState() => _FeedingPageState();
}

class _FeedingPageState extends State<FeedingScreen>{
  @override
  void initState()
  {
    super.initState();
  }
  bool acceptedData = false;
  String bowl = 'assets/images/DogBowl.png';
  String text = 'Drag the food to the bowl';
  @override
  Widget build(BuildContext context){
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Feeding time'),
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
                        Align(
                          alignment: Alignment(0.0, -0.9),
                          child: Text(
                            text,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.171875,
                              fontSize: 30.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0),

                              /* letterSpacing: 0.0, */
                            ),
                          ),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Padding(padding: EdgeInsets.symmetric(vertical: 50),),
                              Draggable<bool>(
                                // Data is the value this Draggable stores.
                                data: true,
                                feedback: Container(
                                  child: ClipRRect(
                                    child: Container(
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
                                childWhenDragging: Container(
                                  height: 100.0,
                                  width: 100.0,
                                ),
                                maxSimultaneousDrags: (acceptedData) ? 0 : 1,
                                child: Container(
                                  child: ClipRRect(
                                    child: Container(
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
                              ),

                              //const Padding(padding: EdgeInsets.symmetric(vertical: 10),),

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

                              const Padding(padding: EdgeInsets.symmetric(vertical: 30),),

                              Container(
                                child: Visibility(
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                    ),
                                    visible: !acceptedData
                                ),
                              ),

                              Container(
                                child: Visibility(
                                    child: Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        size: 100.0
                                    ),
                                    visible: acceptedData
                                ),
                              ),

                              const Padding(padding: EdgeInsets.symmetric(vertical: 30),),

                              DragTarget<bool>(
                                builder: (
                                    BuildContext context,
                                    List<dynamic> accepted,
                                    List<dynamic> rejected,
                                    ) {
                                  return Container(
                                    child: ClipRRect(
                                      child: Container(
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
                                    ),
                                  );
                                },
                                onAccept: (bool data) {
                                  /*localNotifications.show(
                                      1,
                                      "Yummy!!!",
                                      "You fed your pet",
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
                                  setState(() {
                                    text = 'Food is ready!!!';
                                    acceptedData = data;
                                    if(acceptedData)
                                      bowl = 'assets/images/FoodBowl.png';
                                  });
                                },),
                            ]
                        )
                      ],
                    )
                )
            )
        )
    );

  }
}